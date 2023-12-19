#  Copyright (C) 2023, Advanced Micro Devices, Inc.
#  Copyright (C) 2023 FastML
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.
import os
import torch
import torch.nn as nn 

import brevitas.nn as qnn
from brevitas.core.quant import QuantType
from brevitas.core.scaling import ScalingImplType

from functools import reduce
from pyverilator import PyVerilator

from logicnets.quant import QuantBrevitasActivation
from logicnets.nn import SparseLinearNeq, RandomFixedSparsityMask2D

class EncoderNeqModel(nn.Module):
    def __init__(
        self,
        config,
        input_length=64,
        output_length=16,
    ):
        super(EncoderNeqModel, self).__init__()
        self.encoded_dim = 16
        self.shape = (1, 8, 8)  # PyTorch defaults to (C, H, W)
        self.input_length = input_length
        self.output_length = output_length
        self.num_neurons = (
            [input_length] + config["hidden_layer"] + [output_length]
        )

        self.is_verilog_inference = False
        self.latency = 1
        self.verilog_dir = None
        self.top_module_filename = None
        self.dut = None
        self.logfile = None

        # Build encoder
        layers = []

        self.input_quant = QuantBrevitasActivation(
            qnn.QuantHardTanh(
                bit_width=config["input_bitwidth"], 
                quant_type=QuantType.INT,
                scaling_impl_type=ScalingImplType.PARAMETER,
                max_val=1,
                narrow_range=False,
            ),
            pre_transforms=[nn.Flatten()]
        )
        for i in range(len(config["hidden_layer"])):
            out_features = config["hidden_layer"][i]
            bn = nn.BatchNorm1d(out_features)
            if i == 0: # First layer
                in_features = self.input_length
                lin_mask = RandomFixedSparsityMask2D(
                    in_features, out_features, fan_in=config["input_fanin"],
                )
                output_quant = QuantBrevitasActivation(
                    qnn.QuantReLU(
                        bit_width=config["activation_bitwidth"][i], 
                        quant_type=QuantType.INT,
                        scaling_impl_type=ScalingImplType.PARAMETER,
                        max_val=1,
                    ),
                    pre_transforms=[bn],
                )
                sparse_lin_neq_layer = SparseLinearNeq(
                    in_features, 
                    out_features, 
                    input_quant=self.input_quant, 
                    output_quant=output_quant,
                    sparse_linear_kws={'mask': lin_mask},
                )
                layers.append(sparse_lin_neq_layer)
            else:
                in_features = config["hidden_layer"][i - 1]
                lin_mask = RandomFixedSparsityMask2D(
                    in_features, 
                    out_features, 
                    fan_in=config["neuron_fanin"][i - 1],
                )
                output_quant = QuantBrevitasActivation(
                    qnn.QuantReLU(
                        bit_width=config["activation_bitwidth"][i], 
                        quant_type=QuantType.INT,
                        scaling_impl_type=ScalingImplType.PARAMETER,
                        max_val=1,
                    ),
                    pre_transforms=[bn],
                )
                sparse_lin_neq_layer = SparseLinearNeq(
                    in_features, 
                    out_features, 
                    input_quant=layers[-1].output_quant, 
                    output_quant=output_quant,
                    sparse_linear_kws={'mask': lin_mask},
                    apply_input_quant=False,
                )
                layers.append(sparse_lin_neq_layer)
        # Output layer
        lin_mask = RandomFixedSparsityMask2D(
            config["hidden_layer"][-1], 
            self.encoded_dim, 
            fan_in=config["neuron_fanin"][-1],
        )
        bn = nn.BatchNorm1d(self.output_length)
        output_quant = QuantBrevitasActivation(
            qnn.QuantHardTanh(
                bit_width=config["output_bitwidth"], 
                quant_type=QuantType.INT,
                scaling_impl_type=ScalingImplType.PARAMETER,
                max_val=1,
                narrow_range=False,
            ),
            pre_transforms=[bn],
        )
        sparse_lin_neq_layer = SparseLinearNeq(
            config["hidden_layer"][-1], 
            self.encoded_dim, 
            # Make sure same quant object as prev layer's output quant
            input_quant=layers[-1].output_quant, 
            output_quant=output_quant,
            sparse_linear_kws={'mask': lin_mask},
            apply_input_quant=False,
        )
        layers.append(sparse_lin_neq_layer)
        self.module_list = nn.ModuleList(layers)

    def reset_parameters(self):
        """
        Reset parameters in all of the linear layers in the encoder
        """
        for l in self.module_list:
            if type(l) == SparseLinearNeq:
                l.fc.reset_parameters()

    # LogicNets forward methods
    def verilog_forward(self, x):
        # Get integer output from the first layer
        input_quant = self.module_list[0].input_quant
        output_quant = self.module_list[-1].output_quant
        _, input_bitwidth = self.module_list[0].input_quant.get_scale_factor_bits()
        output_scale, output_bitwidth = self.module_list[-1].output_quant.get_scale_factor_bits()
        input_bitwidth, output_bitwidth = int(input_bitwidth), int(output_bitwidth)
        total_input_bits = self.module_list[0].in_features*input_bitwidth
        total_output_bits = self.module_list[-1].out_features*output_bitwidth
        num_layers = len(self.module_list)
        input_quant.bin_output()
        self.module_list[0].apply_input_quant = False
        y = torch.zeros(x.shape[0], self.module_list[-1].out_features)
        x = input_quant(x)
        self.dut.io.rst = 0
        self.dut.io.clk = 0
        for i in range(x.shape[0]):
            x_i = x[i,:]
            y_i = self.pytorch_forward(x[i:i+1,:], apply_scale=False)[0]
            xv_i = list(map(lambda z: input_quant.get_bin_str(z), x_i))
            ys_i = list(map(lambda z: output_quant.get_bin_str(z), y_i))
            xvc_i = reduce(lambda a,b: a+b, xv_i[::-1])
            ysc_i = reduce(lambda a,b: a+b, ys_i[::-1])
            self.dut["M0"] = int(xvc_i, 2)
            for j in range(self.latency + 1):
                #print(self.dut.io.M5)
                res = self.dut[f"M{num_layers}"]
                result = f"{res:0{int(total_output_bits)}b}"
                self.dut.io.clk = 1
                self.dut.io.clk = 0
            expected = f"{int(ysc_i,2):0{int(total_output_bits)}b}"
            result = f"{res:0{int(total_output_bits)}b}"
            assert(expected == result), f"\nexpect = {expected}\nresult = {result}"
            res_split = [
                result[i:i+output_bitwidth] 
                for i in range(0, len(result), output_bitwidth)
            ][::-1]
            yv_i = torch.Tensor(list(map(lambda z: int(z, 2), res_split)))
            y[i,:] = yv_i - torch.abs(torch.min(output_quant.get_bin_state_space()))
            # Dump the I/O pairs
            if self.logfile is not None:
                with open(self.logfile, "a") as f:
                    f.write(f"{int(xvc_i,2):0{int(total_input_bits)}b}{int(ysc_i,2):0{int(total_output_bits)}b}\n")
        output = y * output_scale
        return output

    def pytorch_forward(self, x):
        for i, l in enumerate(self.module_list):
            x = l(x)
        return x
    
    def forward(self, x):
        if self.is_verilog_inference:
            return self.verilog_forward(x)
        return self.pytorch_forward(x)
        
    def verilog_inference(
        self, 
        verilog_dir, 
        top_module_filename, 
        logfile=None, 
        add_registers: bool = False
    ):
        self.verilog_dir = os.path.realpath(verilog_dir)
        self.top_module_filename = top_module_filename
        self.dut = PyVerilator.build(
            f"{self.verilog_dir}/{self.top_module_filename}", 
            verilog_path=[self.verilog_dir], 
            build_dir=f"{self.verilog_dir}/verilator"
        )
        self.is_verilog_inference = True
        self.logfile = logfile
        if add_registers:
            self.latency = len(self.num_neurons)

    def pytorch_inference(self):
        self.is_verilog_inference = False


class EncoderLutModel(EncoderNeqModel):
    def pytorch_forward(self, x, apply_scale=True):
        x = EncoderNeqModel.pytorch_forward(self, x)
        scale, _ = self.module_list[-1].output_quant.get_scale_factor_bits()
        out = x * scale if apply_scale else x
        return out


class EncoderFloatModel(nn.Module):
    """
    Encoder with float weights and activations (except output is quantized) used
    to train decoder for ensemble learning with a fixed, pretrained decoder.
    """
    def __init__(
        self, 
        input_length=64, 
        num_dense_feat=128, 
        output_length=16, 
        qid_bitwidth=5,
    ):
        super(EncoderFloatModel, self).__init__()
        self.encoded_dim = output_length
        self.flatten = nn.Flatten()
        self.dense1 = nn.Linear(input_length, num_dense_feat)
        self.bn1 = nn.BatchNorm1d(num_dense_feat)
        self.relu1 = nn.ReLU()
        self.dense2 = nn.Linear(num_dense_feat, self.encoded_dim)
        self.bn2 = nn.BatchNorm1d(self.encoded_dim)
        self.qidentity = qnn.QuantIdentity(
            bit_width=qid_bitwidth, quant_type=QuantType.INT, 
        )

    def forward(self, x):
        x = self.flatten(x)
        x = self.dense1(x)
        x = self.bn1(x)
        x = self.relu1(x)
        x = self.dense2(x)
        x = self.bn2(x)
        return self.qidentity(x)