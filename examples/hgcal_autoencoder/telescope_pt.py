#  Copyright (C) 2023, Advanced Micro Devices, Inc.
#  Copyright (C) 2021-2023 FastML
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
import numpy as np

"""
PyTorch implementation of telescope loss functions. See below for details on the telescope loss functions.
--------------------------------------------------------------------------------
Auxilliary  functions to calculate the telescope metric
C. Herwig

Masks correspond to groupings of 2x2 cells
They are weighted to account for edge TCs that enter fewer 2x2 supercells than those in the center of the sensor.

the idea is that we want to associate shape information to each TC, so each TC should contribute an equal amount to the information encoded in the loss associated to the collection of 2x2 super cells.
to derive the weights, we first ask how many 2x2 cells each TC enters and get values like

1 2 2 2 | 2 2 2 1
2 4 4 4 | 4 4 4 2
2 4 4 4 | 4 4 4 2
2 4 4 3 | 3 4 4 2
-------  --------
2 4 4 3 | #     ^
2 4 4 4 | #     |
2 4 4 4 | # <-- these edges
1 2 2 2 | #     are associated 

e.g. the very top left TC only enters one 2x2 tower (as top left TC)
while the one next to it can be the top left or top right TC of a 2x2 supercell

the 2x2 SC weights are derived to ensure that each TC contributes equally regardless of how many supercells it enters (she contributed shape info will just be less). This ensures that there are no charge-dependent biases.

the weights for a SC is the sum of the inverses of the # of times each constituent TC enters a TC
i.e. the weight for a SC combined from the upper left 2x2 is
W = 1/1 + 1/2 + 1/2 + 1/4 = 2.25
while for a SC shifted one TC to the right the weight is 2*1/4+2*1/2=1.5
"""


# combine neighbor cells in 2x2 grids, record weights
# multilpy weights by 0.25 for now to account for effective increase in cells from 12 (sum weights now 48 not 12)
SCmask_48_36 = torch.tensor(
    [
        [0, 1, 4, 5, 0.25 * 1.5],  # 2x2 supercells that perfectly tile the sensor
        [2, 3, 6, 7, 0.25 * 1.0 + 1.0 / 12],  # 4 TC indices for 1 supercell (+) weight
        [8, 9, 12, 13, 0.25 * 2.25],
        [10, 11, 14, 15, 0.25 * 1.5],
        [16, 17, 20, 21, 0.25 * 1.5],
        [18, 19, 22, 23, 0.25 * 1.0 + 1.0 / 12],
        [24, 25, 28, 29, 0.25 * 2.25],
        [26, 27, 30, 31, 0.25 * 1.5],
        [32, 33, 36, 37, 0.25 * 1.5],
        [34, 35, 38, 39, 0.25 * 1.0 + 1.0 / 12],
        [40, 41, 44, 45, 0.25 * 2.25],
        [42, 43, 46, 47, 0.25 * 1.5],
        [4, 5, 8, 9, 0.25 * 1.5],  # shift right by one TC (2/2x2)
        [6, 7, 10, 11, 0.25 * 1.0],
        [20, 21, 24, 25, 0.25 * 1.5],
        [22, 23, 26, 27, 0.25 * 1.0],
        [36, 37, 40, 41, 0.25 * 1.5],
        [38, 39, 42, 43, 0.25 * 1.0],
        [1, 2, 5, 6, 0.25 * 1.0],  # shift down by one TC (2/2x2)
        [9, 10, 13, 14, 0.25 * 1.5],
        [17, 18, 21, 22, 0.25 * 1.0],
        [25, 26, 29, 30, 0.25 * 1.5],
        [33, 34, 37, 38, 0.25 * 1.0],
        [41, 42, 45, 46, 0.25 * 1.5],
        [5, 6, 9, 10, 0.25 * 1.0],  # shift down and right by one TC (1/2x2)
        [21, 22, 25, 26, 0.25 * 1.0],
        [37, 38, 41, 42, 0.25 * 1.0],
        [0, 1, 27, 31, 0.25 * 1.5],  # inter-2x2 overlaps
        [1, 2, 23, 27, 0.25 * 1.0],
        [2, 3, 19, 23, 0.25 * 1.0 + 1.0 / 6],
        [3, 7, 34, 35, 0.25 * 1.0 + 1.0 / 6],
        [7, 11, 33, 34, 0.25 * 1.0],
        [11, 15, 32, 33, 0.25 * 1.5],
        [16, 17, 47, 43, 0.25 * 1.5],
        [17, 18, 43, 39, 0.25 * 1.0],
        [18, 19, 39, 35, 0.25 * 1.0 + 1.0 / 6],
    ]
)
Remap_48_36 = torch.zeros((48, 36))
for isc, sc in enumerate(SCmask_48_36):
    for tc in sc[:4]:
        Remap_48_36[int(tc), isc] = 1

Weights_48_36 = SCmask_48_36[:, 4]

# keep simplified 12 x 3 mapping for now
SCmask_48_12 = torch.tensor(
    [
        [0, 1, 4, 5],
        [2, 3, 6, 7],
        [8, 9, 12, 13],
        [10, 11, 14, 15],
        [16, 17, 20, 21],
        [18, 19, 22, 23],
        [24, 25, 28, 29],
        [26, 27, 30, 31],
        [32, 33, 36, 37],
        [34, 35, 38, 39],
        [40, 41, 44, 45],
        [42, 43, 46, 47],
    ]
)

Remap_48_12 = torch.zeros((48, 12))
for isc, sc in enumerate(SCmask_48_12):
    for tc in sc:
        Remap_48_12[int(tc), isc] = 1

Remap_12_3 = torch.zeros((12, 3))
for i in range(12):
    Remap_12_3[i, int(i / 4)] = 1


def telescopeMSE2(y_true, y_pred, reduction=True):
    y_true = y_true.to(dtype=y_pred.dtype)

    # TC-level MSE
    y_pred_rs = torch.reshape(y_pred, (-1, 48))
    y_true_rs = torch.reshape(y_true, (-1, 48))
    loss_tc1 = torch.mean(
        torch.square(y_true_rs - y_pred_rs) * torch.max(y_pred_rs, y_true_rs),
        dim=-1,
    )

    # map TCs to 2x2 supercells and compute MSE
    y_pred_36 = torch.matmul(y_pred_rs, Remap_48_36)
    y_true_36 = torch.matmul(y_true_rs, Remap_48_36)
    loss_tc2 = torch.mean(
        torch.square(y_true_36 - y_pred_36)
        * torch.max(y_pred_36, y_true_36)
        * Weights_48_36,
        dim=-1,
    )

    # map 2x2 supercells to 4x4 supercells and compute MSE
    y_pred_12 = torch.matmul(y_pred_rs, Remap_48_12)
    y_true_12 = torch.matmul(y_true_rs, Remap_48_12)
    y_pred_3 = torch.matmul(y_pred_12, Remap_12_3)
    y_true_3 = torch.matmul(y_true_12, Remap_12_3)
    loss_tc3 = torch.mean(
        torch.square(y_true_3 - y_pred_3) * torch.max(y_pred_3, y_true_3), dim=-1
    )
    if not reduction:
        return 4 * loss_tc1 + 2 * loss_tc2 + loss_tc3

    return 4 * loss_tc1.mean() + 2 * loss_tc2.mean() + loss_tc3.mean()


remap_8x8 = [
    4,
    12,
    20,
    28,
    5,
    13,
    21,
    29,
    6,
    14,
    22,
    30,
    7,
    15,
    23,
    31,
    24,
    25,
    26,
    27,
    16,
    17,
    18,
    19,
    8,
    9,
    10,
    11,
    0,
    1,
    2,
    3,
    59,
    51,
    43,
    35,
    58,
    50,
    42,
    34,
    57,
    49,
    41,
    33,
    56,
    48,
    40,
    32,
]
remap_8x8_matrix = torch.zeros(48 * 64, dtype=torch.float32).reshape((64, 48))

for i in range(48):
    remap_8x8_matrix[remap_8x8[i], i] = 1


def move_constants_to_gpu():
    global remap_8x8_matrix, Remap_48_36, Remap_48_12, Remap_12_3, Weights_48_36
    # NOTE: unclear if this works for multi-gpu training, but that is overkill for this model
    # for dev in devices:
    #     cuda_dev = "cuda:" + str(dev)
    #     remap_8x8_matrix = remap_8x8_matrix.to(torch.device(cuda_dev))
    #     Remap_48_36 = Remap_48_36.to(torch.device(cuda_dev))
    #     Remap_48_12 = Remap_48_12.to(torch.device(cuda_dev))
    #     Remap_12_3 = Remap_12_3.to(torch.device(cuda_dev))
    #     Weights_48_36 = Weights_48_36.to(torch.device(cuda_dev))

    cuda_dev = "cuda:0"
    remap_8x8_matrix = remap_8x8_matrix.to(torch.device(cuda_dev))
    Remap_48_36 = Remap_48_36.to(torch.device(cuda_dev))
    Remap_48_12 = Remap_48_12.to(torch.device(cuda_dev))
    Remap_12_3 = Remap_12_3.to(torch.device(cuda_dev))
    Weights_48_36 = Weights_48_36.to(torch.device(cuda_dev))


def telescopeMSE8x8(y_true, y_pred, reduction=True):
    y_true = y_true.to(dtype=y_pred.dtype)
    return telescopeMSE2(
        torch.matmul(torch.reshape(y_true, (-1, 64)), remap_8x8_matrix),
        torch.matmul(torch.reshape(y_pred, (-1, 64)), remap_8x8_matrix),
        reduction=reduction,
    )
