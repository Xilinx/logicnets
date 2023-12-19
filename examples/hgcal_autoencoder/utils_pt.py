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

import ot
import torch
import numpy as np

hexCoords = np.array(
    [
        [0.0, 0.0],
        [0.0, -2.4168015],
        [0.0, -4.833603],
        [0.0, -7.2504044],
        [2.09301, -1.2083969],
        [2.09301, -3.6251984],
        [2.09301, -6.042],
        [2.09301, -8.458794],
        [4.18602, -2.4168015],
        [4.18602, -4.833603],
        [4.18602, -7.2504044],
        [4.18602, -9.667198],
        [6.27903, -3.6251984],
        [6.27903, -6.042],
        [6.27903, -8.458794],
        [6.27903, -10.875603],
        [-8.37204, -10.271393],
        [-6.27903, -9.063004],
        [-4.18602, -7.854599],
        [-2.0930138, -6.6461945],
        [-8.37204, -7.854599],
        [-6.27903, -6.6461945],
        [-4.18602, -5.4377975],
        [-2.0930138, -4.229393],
        [-8.37204, -5.4377975],
        [-6.27903, -4.229393],
        [-4.18602, -3.020996],
        [-2.0930138, -1.8125992],
        [-8.37204, -3.020996],
        [-6.27903, -1.8125992],
        [-4.18602, -0.6042023],
        [-2.0930138, 0.6042023],
        [4.7092705, -12.386101],
        [2.6162605, -11.177696],
        [0.5232506, -9.969299],
        [-1.5697594, -8.760895],
        [2.6162605, -13.594498],
        [0.5232506, -12.386101],
        [-1.5697594, -11.177696],
        [-3.6627693, -9.969299],
        [0.5232506, -14.802895],
        [-1.5697594, -13.594498],
        [-3.6627693, -12.386101],
        [-5.7557793, -11.177696],
        [-1.5697594, -16.0113],
        [-3.6627693, -14.802895],
        [-5.7557793, -13.594498],
        [-7.848793, -12.386101],
    ]
)
# normalize so that distance between small cells (there are 4 per TC) is 1
oneHexCell = 0.5 * 2.4168015
hexCoords = hexCoords / oneHexCell
# pairwise distances
hex_metric = ot.dist(hexCoords, hexCoords, "euclidean")


def normalize(data, sumlog2=True):
    """
    Normalize data by dividing by the sum of the log2 of the occupancy
    """
    maxes = []
    sums = []
    sums_log2 = []
    for i in range(len(data)):
        maxes.append(data[i].max())
        sums.append(data[i].sum())
        sums_log2.append(2 ** (np.floor(np.log2(data[i].sum()))))
        if sumlog2:
            data[i] = 1.0 * data[i] / (sums_log2[-1] if sums_log2[-1] else 1.0)
        else:
            data[i] = 1.0 * data[i] / (data[i].sum() if data[i].sum() else 1.0)
    sums_arr = np.array(sums_log2) if sumlog2 else np.array(sums)
    return (
        data,
        np.array(maxes),
        sums_arr,
    )


def unnormalize(norm_data, max_vals, sumlog2=True):
    for i in range(len(norm_data)):
        if sumlog2:
            sumlog2 = 2 ** (torch.floor(torch.log2(norm_data[i].sum())))
            norm_data[i] = norm_data[i] * max_vals[i] / (sumlog2 if sumlog2 else 1.0)
        else:
            norm_data[i] = (
                norm_data[i]
                * max_vals[i]
                / (norm_data[i].sum() if norm_data[i].sum() else 1.0)
            )
    return norm_data


def emd(_x, _y, threshold=-1):
    if np.sum(_x) == 0:
        return -1.0
    if np.sum(_y) == 0:
        return -0.5
    x = np.array(_x, dtype=np.float64)
    y = np.array(_y, dtype=np.float64)
    x = (1.0 / x.sum() if x.sum() else 1.0) * x.flatten()
    y = (1.0 / y.sum() if y.sum() else 1.0) * y.flatten()

    if threshold > 0:
        # only keep entries above 2%, e.g.
        x = np.where(x > threshold, x, 0)
        y = np.where(y > threshold, y, 0)
        x = 1.0 * x / x.sum()
        y = 1.0 * y / y.sum()

    return ot.emd2(x, y, hex_metric)
