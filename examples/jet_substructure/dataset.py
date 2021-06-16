#  Copyright (C) 2021 Xilinx, Inc
#  Copyright (C) 2020 FastML
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

import h5py
import yaml
import numpy as np
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn import preprocessing
import torch
from torch.utils.data import Dataset

# Based off example from: https://github.com/hls-fpga-machine-learning/pytorch-training/blob/master/train/Data_loader.py
# Creates a PyTorch Dataset from the h5 file input.
# Returns labels as a one-hot encoded vector.
# Input / output labels are contained in self.feature_labels / self.output_labels respectively
class JetSubstructureDataset(Dataset):
    def __init__(self, input_file, config_file, split="train"):
        super().__init__()

        self.split = split

        with h5py.File(input_file, 'r') as h5py_file:
            tree_array = h5py_file["t_allpar_new"][()]

        with open(config_file, 'r') as f:
           self.config = yaml.load(f) 

        # TODO: Add warnings about unused dictionary entries
        self.feature_labels = self.config["Inputs"]
        self.output_labels = self.config["Labels"]

        # Filter input file and convert inputs / outputs to numpy array
        dataset_df = pd.DataFrame(tree_array,columns=list(set(self.feature_labels+self.output_labels)))
        dataset_df = dataset_df.drop_duplicates()
        features_df = dataset_df[self.feature_labels]
        outputs_df = dataset_df[self.output_labels]
        X = features_df.values
        y = outputs_df.values
        if "j_index" in self.feature_labels:
            X = X[:,:-1] # drop the j_index feature
        if "j_index" in self.output_labels:
            # drop the j_index label
            y = y[:,:-1]
            self.output_labels = self.output_labels[:-1]
        X_train_val, X_test, y_train_val, y_test = train_test_split(X, y, test_size=0.2, random_state=42) # Using the same dataset split as: https://github.com/hls-fpga-machine-learning/pytorch-training/blob/master/train/Data_loader.py
        if self.config["NormalizeInputs"]:
            scaler = preprocessing.StandardScaler().fit(X_train_val)
            # scaler = preprocessing.MinMaxScaler().fit(X_train_val)
            X_train_val = scaler.transform(X_train_val)
            X_test = scaler.transform(X_test)

        if self.config["ApplyPca"]:
            # Apply dimenionality reduction to the inputs
            with torch.no_grad():
                dim = self.config["PcaDimensions"]
                X_train_val_fp64 = torch.from_numpy(X_train_val).double()
                X_test_fp64 = torch.from_numpy(X_test).double()
                U,S,V = torch.svd(X_train_val_fp64)
                X_train_val_pca_fp64 = torch.mm(X_train_val_fp64, V[:,0:dim])
                X_test_pca_fp64 = torch.mm(X_test_fp64, V[:,0:dim])
                variance_retained = 100*(S[0:dim].sum() / S.sum())
                print(f"Dimensions used for PCA: {dim}")
                print(f"Variance retained (%): {variance_retained}")
                X_train_val = X_train_val_pca_fp64.float().numpy()
                X_test = X_test_pca_fp64.float().numpy()

        if self.split == "train":
            self.X = torch.from_numpy(X_train_val)
            self.y = torch.from_numpy(y_train_val)
        elif self.split == "test":
            self.X = torch.from_numpy(X_test)
            self.y = torch.from_numpy(y_test)

    def __len__(self):
        return len(self.X)

    def __getitem__(self, idx):
        return (self.X[idx], self.y[idx])

