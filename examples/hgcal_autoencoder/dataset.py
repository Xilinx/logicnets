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
import numpy as np
import pandas as pd

from torch.utils.data import Dataset
from utils_pt import normalize

ARRANGE = torch.tensor(
    [
        28,
        29,
        30,
        31,
        0,
        4,
        8,
        12,
        24,
        25,
        26,
        27,
        1,
        5,
        9,
        13,
        20,
        21,
        22,
        23,
        2,
        6,
        10,
        14,
        16,
        17,
        18,
        19,
        3,
        7,
        11,
        15,
        47,
        43,
        39,
        35,
        35,
        34,
        33,
        32,
        46,
        42,
        38,
        34,
        39,
        38,
        37,
        36,
        45,
        41,
        37,
        33,
        43,
        42,
        41,
        40,
        44,
        40,
        36,
        32,
        47,
        46,
        45,
        44,
    ]
)

ARRANGE_MASK = torch.tensor(
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

class HGCalAutoencoderDataset(Dataset):
    def __init__(
            self, 
            data_file, 
            data_dir=None, 
            process_data=False,
            split="train",
    ) -> None:
        super().__init__()
        self.data_dir = data_dir
        self.data_file = data_file
        self.calq_cols = [f"CALQ_{i}" for i in range(48)]
        self.valid_split = 0.2
        self.val_max = None
        self.val_sum = None
        self.max_data = None
        self.sum_dat = None
        self.train_data = None
        self.val_data = None
        self.split = split

        if process_data: # Only need to run once
            self.process_data()
        
        # Load data from provided npy data_file
        shaped_data = np.load(self.data_file)
        print(f"Loaded shaped data shape: {shaped_data.shape}")
        print(f"Loaded shaped data datatype: {shaped_data.dtype}")

        self.train_data = shaped_data[int(len(shaped_data) * self.valid_split) :]
        self.val_data = shaped_data[: int(len(shaped_data) * self.valid_split)]

        if self.split == "train":
            self.X = self.train_data
        elif self.split == "test":
            self.X = self.val_data

    def mask_data(self, data):
        """
        Mask rows where occupancy is zero
        """
        return data[data[self.calq_cols].astype("float32").sum(axis=1) != 0]

    def load_data_dir(self):
        """
        Read and concat all csv files in the data directory into a single
        dataframe
        """
        print(f"Reading files {os.listdir(self.data_dir)}")
        data = pd.concat(
            [
                pd.read_csv(os.path.join(self.data_dir, file))
                for file in os.listdir(self.data_dir)
            ]
        )
        data = self.mask_data(data)
        data = data[self.calq_cols].astype("float32")
        print(f"Input data shape: {data.shape}")

        return data

    def prep_input(self, norm_data, shape=(1, 8, 8)):
        """
        Prepare the input data for the model
        """
        input_data = norm_data[:, ARRANGE]
        input_data[:, ARRANGE_MASK == 0] = 0  # zero out repeated entries
        shaped_data = input_data.reshape(len(input_data), shape[0], shape[1], shape[2])
        print(f"Prepped shaped data shape: {shaped_data.shape}")
        return shaped_data

    def get_val_max_and_sum(self):
        shaped_data, max_data, sum_data = self.process_data(save=False)
        max_data = max_data / 35.0  # normalize to units of transverse MIPs
        sum_data = sum_data / 35.0  # normalize to units of transverse MIPs
        val_index = np.arange(int(len(shaped_data) * self.valid_split))
        self.val_max = max_data[val_index]
        self.val_sum = sum_data[val_index]
        return self.val_max, self.val_sum

    def process_data(self, save=True):
        """
        Only need to run once to prepare the data and pickle it
        """
        data = self.load_data_dir()
        norm_data, max_data, sum_data = normalize(data.values.copy())
        shaped_data = self.prep_input(norm_data)
        if save:
            np.save(self.data_file, shaped_data)
        return shaped_data, max_data, sum_data

    def __len__(self):
        return len(self.X)
    
    def __getitem__(self, idx):
        return self.X[idx]