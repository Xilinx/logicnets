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
#  Copyright (C) 2023, Advanced Micro Devices, Inc.
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
#  limitations under the License.import os

import torch
import torch.nn as nn 

import brevitas.nn as qnn
from brevitas.core.quant import QuantType
from brevitas.core.scaling import ScalingImplType

from functools import reduce
from pyverilator import PyVerilator

from logicnets.quant import QuantBrevitasActivation
from logicnets.nn import SparseLinearNeq, RandomFixedSparsityMask2D

from encoder import EncoderNeqModel, EncoderLutModel, EncoderFloatModel
from decoder import Decoder

from dataset import ARRANGE, ARRANGE_MASK


CALQ_MASK = torch.tensor(
    [
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        0,
        0,
        0,
        0,
        1,
        1,
        1,
        1,
        0,
        0,
        0,
        0,
        1,
        1,
        1,
        1,
        0,
        0,
        0,
        0,
        1,
        1,
        1,
        1,
        0,
        0,
        0,
        0,
    ]
)

class AutoencoderNeqModel(nn.Module):
    def __init__(
        self,
        config,
        input_length=64,
        output_length=16,
    ):
        super(AutoencoderNeqModel, self).__init__()
        self.encoded_dim = 16
        self.shape = (1, 8, 8)  # PyTorch defaults to (C, H, W)
        self.val_sum = None
        self.num_neurons = [input_length] + config["hidden_layer"] + [output_length]

        self.encoder = EncoderNeqModel(
            config=config,
            input_length=input_length,
            output_length=output_length,
        )
        self.decoder = Decoder(128)
        self.is_verilog_inference = False

    # Methods to measure model's physics performance
    def invert_arrange(self):
        """
        Invert the arrange mask
        """
        remap = []
        hashmap = {}  # cell : index mapping
        found_duplicate_charge = len(ARRANGE[ARRANGE_MASK == 1]) > len(
            torch.unique(ARRANGE[ARRANGE_MASK == 1])
        )
        for i in range(len(ARRANGE)):
            if ARRANGE_MASK[i] == 1:
                if found_duplicate_charge:
                    if CALQ_MASK[i] == 1:
                        hashmap[int(ARRANGE[i])] = i
                else:
                    hashmap[int(ARRANGE[i])] = i
        for i in range(len(torch.unique(ARRANGE))):
            remap.append(hashmap[i])
        return torch.tensor(remap)

    def map_to_calq(self, x):
        """
        Map the input/output of the autoencoder into CALQs orders
        """
        remap = self.invert_arrange()
        image_size = self.shape[0] * self.shape[1] * self.shape[2]
        reshaped_x = x.reshape(len(x), image_size)
        reshaped_x[:, ARRANGE_MASK == 0] = 0
        return reshaped_x[:, remap]

    def set_val_sum(self, val_sum):
        self.val_sum = val_sum

    # LogicNets forward methods
    def verilog_forward(self, x):
        z = self.encoder.verilog_forward(x)
        x_hat = self.decoder(z)
        return x_hat

    def pytorch_forward(self, x):
        return self.decoder(self.encoder(x))
    
    def forward(self, x):
        if self.is_verilog_inference:
            return self.verilog_forward(x)
        return self.pytorch_forward(x)
        
    def verilog_inference(self, verilog_dir, top_module_filename, logfile=None, add_registers: bool = False):
        self.encoder.verilog_inference(
            verilog_dir,
            top_module_filename,
            logfile=logfile,
            add_registers=add_registers,
        )
        self.is_verilog_inference = True

    def pytorch_inference(self):
        self.is_verilog_inference = False


class AutoencoderLutModel(AutoencoderNeqModel):
    
    def __init__(
        self,
        config,
        input_length=64,
        output_length=16,
    ):
        AutoencoderNeqModel.__init__(
            self,
            config,
            input_length=input_length,
            output_length=output_length,
        )
        self.encoder = EncoderLutModel(
            config,
            input_length=input_length,
            output_length=output_length,
        )

class AutoencoderFloatModel(nn.Module):
    def __init__(self, config):
        super(AutoencoderFloatModel, self).__init__()
        self.shape = (1, 8, 8)  # PyTorch defaults to (C, H, W)
        self.encoder = EncoderFloatModel(
            num_dense_feat=config["num_dense_feat"],
            qid_bitwidth=config["output_bitwidth"],
        )
        self.decoder = Decoder(num_dense_feat=config["num_dense_feat"])

    # Methods to measure model's physics performance
    def invert_arrange(self):
        """
        Invert the arrange mask
        """
        remap = []
        hashmap = {}  # cell : index mapping
        found_duplicate_charge = len(ARRANGE[ARRANGE_MASK == 1]) > len(
            torch.unique(ARRANGE[ARRANGE_MASK == 1])
        )
        for i in range(len(ARRANGE)):
            if ARRANGE_MASK[i] == 1:
                if found_duplicate_charge:
                    if CALQ_MASK[i] == 1:
                        hashmap[int(ARRANGE[i])] = i
                else:
                    hashmap[int(ARRANGE[i])] = i
        for i in range(len(torch.unique(ARRANGE))):
            remap.append(hashmap[i])
        return torch.tensor(remap)

    def map_to_calq(self, x):
        """
        Map the input/output of the autoencoder into CALQs orders
        """
        remap = self.invert_arrange()
        image_size = self.shape[0] * self.shape[1] * self.shape[2]
        reshaped_x = x.reshape(len(x), image_size)
        reshaped_x[:, ARRANGE_MASK == 0] = 0
        return reshaped_x[:, remap]

    def set_val_sum(self, val_sum):
        self.val_sum = val_sum

    def forward(self, x):
        return self.decoder(self.encoder(x))

