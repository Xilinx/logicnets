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
import torch
import torch.nn as nn 


class Decoder(nn.Module):
    def __init__(
        self,
        num_dense_feat=128,
    ):
        super(Decoder, self).__init__()
        self.encoded_dim = 16
        self.shape = (1, 8, 8)  # PyTorch defaults to (C, H, W)
        self.num_dense_feat = num_dense_feat

        self.dec_dense1 = nn.Linear(self.encoded_dim, self.num_dense_feat)
        self.relu1 = nn.ReLU()
        self.dec_dense2 = nn.Linear(self.num_dense_feat, 64)
        self.relu2 = nn.ReLU()
        self.convtrans2d = nn.ConvTranspose2d(
            1,
            self.shape[0],
            kernel_size=3,
            stride=1,
            padding=1,
        )
        self.sigmoid = nn.Sigmoid()
    
    def forward(self, x):
        x = self.dec_dense1(x)
        x = self.relu1(x)
        x = self.dec_dense2(x)
        x = self.relu2(x)
        x = torch.reshape(x, (-1, 1, 8, 8))
        x = self.convtrans2d(x)
        return self.sigmoid(x)