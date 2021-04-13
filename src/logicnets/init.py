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
from torch import Tensor
from torch.nn import init

# TODO: Expand to support tensors larger than 2 dimensions
def random_restrict_fanin(mask: Tensor, fan_in: int) -> Tensor:
    vector_size, num_vectors = nn.init._calculate_fan_in_and_fan_out(mask)
    init.constant_(mask, 0.0)
    if len(mask.shape) == 2:
        for i in range(num_vectors):
            x = torch.randperm(vector_size)[:fan_in]
            mask[i][x] = 1
    else:
        assert False, "Unsupported mask shape, specified: %s" % (str(mask.shape))
    return mask

