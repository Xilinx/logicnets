#  Copyright (C) 2021 Xilinx, Inc
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

import torch
import torch.nn as nn

from brevitas.core.quant import QuantType
from brevitas.core.quant import RescalingIntQuant, ClampedBinaryQuant
from brevitas.core.scaling import ScalingImplType
import brevitas.nn as bnn

# TODO: Put this inside an abstract base class
def get_int_state_space(bits: int, signed: bool, narrow_range: bool):
    start = int(0 if not signed else (-2**(bits-1) + int(narrow_range))) # calculate the minimum value in the range
    end = int(start + 2**(bits) - int(narrow_range)) # calculate the maximum of the range
    state_space = torch.as_tensor(range(start, end))
    return state_space

# TODO: Put this inside an abstract base class
def get_float_state_space(bits: int, scale_factor: float, signed: bool, narrow_range: bool, quant_type: QuantType):
    if quant_type == QuantType.INT:
        bin_state_space = get_int_state_space(bits, signed, narrow_range)
    elif quant_type == QuantType.BINARY:
        bin_state_space = torch.as_tensor([-1., 1.])
    state_space = scale_factor * bin_state_space
    return state_space

# TODO: Add an abstract class with a specific interface which all brevitas-based classes inherit from?
class QuantBrevitasActivation(nn.Module):

    def __init__(self, brevitas_module, pre_transforms: list = [], post_transforms: list = []):
        super(QuantBrevitasActivation, self).__init__()
        self.brevitas_module = brevitas_module
        self.pre_transforms = nn.ModuleList(pre_transforms)
        self.post_transforms = nn.ModuleList(post_transforms)
        self.is_bin_output = False

    # TODO: Move to a base class
    # TODO: Move the string templates to verilog.py
    def get_bin_str(self, x: int):
        quant_type = self.get_quant_type()
        scale_factor, bits = self.get_scale_factor_bits()
        if quant_type == QuantType.INT:
            tensor_quant = self.brevitas_module.act_quant_proxy.fused_activation_quant_proxy.tensor_quant
            narrow_range = tensor_quant.int_quant.narrow_range
            signed = tensor_quant.int_quant.signed
            offset = 2**(bits-1) -int(narrow_range) if signed else 0
            return f"{int(x+offset):0{int(bits)}b}"
        elif quant_type == QuantType.BINARY:
            return f"{int(x):0{int(bits)}b}"
        else:
            raise Exception("Unknown quantization type: {}".format(quant_type))

    # TODO: Move to a base class
    def bin_output(self):
        self.is_bin_output = True

    # TODO: Move to a base class
    def float_output(self):
        self.is_bin_output = False

    def get_quant_type(self):
        brevitas_module_type = type(self.brevitas_module.act_quant_proxy.fused_activation_quant_proxy.tensor_quant)
        if brevitas_module_type == RescalingIntQuant:
            return QuantType.INT
        elif brevitas_module_type == ClampedBinaryQuant:
            return QuantType.BINARY
        else:
            raise Exception("Unknown quantization type for tensor_quant: {}".format(brevitas_module_type))

    # TODO: Allow for different bitwidths / scales per output
    def get_scale_factor_bits(self):
        # TODO: put guards in this based on quantization type
        quant_proxy = self.brevitas_module.act_quant_proxy
        current_status = quant_proxy.training
        quant_proxy.eval()
        _, scale_factor, bits = quant_proxy(quant_proxy.zero_hw_sentinel)
        quant_proxy.training = current_status
        return scale_factor, bits

    # Return a floating point version of the state space, this return values
    # that PyTorch would see at the output of this layer during training.
    # TODO: Merge this function with 'get_bin_state_space' and remove duplicated code.
    def get_state_space(self):
        quant_type = self.get_quant_type()
        scale_factor, bits = self.get_scale_factor_bits()
        if quant_type == QuantType.INT:
            tensor_quant = self.brevitas_module.act_quant_proxy.fused_activation_quant_proxy.tensor_quant
            narrow_range = tensor_quant.int_quant.narrow_range
            signed = tensor_quant.int_quant.signed
            state_space = get_float_state_space(bits, scale_factor, signed, narrow_range, quant_type)
        elif quant_type == QuantType.BINARY:
            state_space = scale_factor*torch.tensor([-1, 1])
        else:
            raise Exception("Unknown quantization type: {}".format(quant_type))
        return self.apply_post_transforms(state_space)

    # Return the underlying binary representation of the values returned by
    # 'get_state_space'
    def get_bin_state_space(self):
        quant_type = self.get_quant_type()
        _, bits = self.get_scale_factor_bits()
        if quant_type == QuantType.INT:
            tensor_quant = self.brevitas_module.act_quant_proxy.fused_activation_quant_proxy.tensor_quant
            narrow_range = tensor_quant.int_quant.narrow_range
            signed = tensor_quant.int_quant.signed
            state_space = get_int_state_space(bits, signed, narrow_range)
        elif quant_type == QuantType.BINARY:
            state_space = torch.tensor([0, 1])
        else:
            raise Exception("Unknown quantization type: {}".format(quant_type))
        return state_space

    def apply_pre_transforms(self, x):
        for i in range(len(self.pre_transforms)):
            x = self.pre_transforms[i](x)
        return x

    def apply_post_transforms(self, x):
        for i in range(len(self.post_transforms)):
            x = self.post_transforms[i](x)
        return x

    def forward(self, x):
        if self.is_bin_output:
            s, _ = self.get_scale_factor_bits()
            x = self.apply_pre_transforms(x)
            x = self.brevitas_module(x)
            x = torch.round(x/s).type(torch.int64)
        else:
            x = self.apply_pre_transforms(x)
            x = self.brevitas_module(x)
            x = self.apply_post_transforms(x)
        return x

