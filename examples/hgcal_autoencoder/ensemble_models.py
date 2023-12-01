# Copyright (c) 2020 Daniel Friedman
# Copyright (C) 2023, Advanced Micro Devices, Inc.
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

import torch
import torch.nn as nn
import numpy as np

from encoder import EncoderNeqModel
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


class VotingAutoencoderNeqModel(nn.Module): # TODO: Rename to Averaging
    """
    In the voting ensemble method, we train N models independently and average
    their outputs in the end. In our autoencoder use case, we train N encoders
    independently, average their outputs, and pass this to the decoder. This is
    done to maintain the low data rate the encoder's compressed output provides.
    """
    def __init__(
        self, 
        config, 
        input_length=64, 
        output_length=16,
        num_models=4,
    ):
        super(VotingAutoencoderNeqModel, self).__init__()
        self.shape = (1, 8, 8)  # PyTorch defaults to (C, H, W)
        self.val_sum = None
        # TODO: Fix num neurons?
        self.num_neurons = [input_length] + config["hidden_layer"] + [output_length]
        self.num_models = num_models

        self.encoder_ensemble = nn.ModuleList([
            EncoderNeqModel(
                config, input_length=input_length, output_length=output_length
            ) 
            for _ in range(num_models)
        ])
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

    def forward(self, x):
        if self.is_verilog_inference:
            return self.verilog_forward(x)
        return self.pytorch_forward(x)
        
    def pytorch_forward(self, x):
        outputs = [encoder(x) for encoder in self.encoder_ensemble]
        avg_outputs = sum(outputs) / self.num_models
        return self.decoder(avg_outputs)
    
    # TODO: Implement verilog_forward() and verilog_inference()
    def verilog_forward(self, x):
        outputs = [encoder.verilog_forward(x) for encoder in self.encoder_ensemble]
        avg_outputs = sum(outputs) / self.num_models
        return self.decoder(avg_outputs)
    
    def verilog_inference(self, verilog_dir, top_module_filename, logfile=None, add_registers: bool = False):
        pass
    
    def pytorch_inference(self):
        self.is_verilog_inference = False

# TODO: Make BaseEnsemble class?
class SnapshotAutoencoderNeqModel(nn.Module):
    """
    Snapshot ensemble of autoencoder models based on the method introduced in
    https://arxiv.org/pdf/1704.00109.pdf
    """
    def __init__(
        self, 
        config, 
        input_length=64, 
        output_length=16,
        num_models=4,
        single_model_mode=False,
    ):
        super(SnapshotAutoencoderNeqModel, self).__init__()
        self.shape = (1, 8, 8)  # PyTorch defaults to (C, H, W)
        self.val_sum = None
        # TODO: Fix num neurons to match ensemble size for verilog testing?
        self.num_neurons = [input_length] + config["hidden_layer"] + [output_length]
        self.num_models = num_models
        self.single_model_mode = single_model_mode

        # Snapshot ensemble builds the ensemble as it trains. We will save
        # snapshots of encoder to encoder_ensemble list to build the ensemble
        self.encoder = EncoderNeqModel(
            config, input_length=input_length, output_length=output_length
        )
        # Init model differently if training vs finetuning/evaluating
        if self.single_model_mode:
            print("Init in single_model_mode mode!")
            self.encoder_ensemble = nn.ModuleList()
        else:
            print("Init in ensemble mode!")
            # Build the ensemble (for evaluation or finetuning)
            self.encoder_ensemble = nn.ModuleList([
                EncoderNeqModel(
                    config, input_length=input_length, output_length=output_length
                ) 
                for _ in range(num_models)
            ])
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
    
    def forward(self, x):
        if self.is_verilog_inference:
            return self.verilog_forward(x)
        return self.pytorch_forward(x)
    
    def pytorch_forward(self, x):
        if self.single_model_mode:
            return self.decoder(self.encoder(x))
        # Else evaluate on the full ensemble
        outputs = [encoder(x) for encoder in self.encoder_ensemble]
        avg_outputs = sum(outputs) / self.num_models
        return self.decoder(avg_outputs)
    
    # TODO: Implement verilog_forward() and verilog_inference()
    def verilog_forward(self, x):
        outputs = [encoder.verilog_forward(x) for encoder in self.encoder_ensemble]
        avg_outputs = sum(outputs) / self.num_models
        return self.decoder(avg_outputs)
    
    def verilog_inference(self, verilog_dir, top_module_filename, logfile=None, add_registers: bool = False):
        pass


class FGEAutoencoderNeqModel(SnapshotAutoencoderNeqModel):
    """
    Fast Geometric Ensemble of autoencoder models based on the method introduced
    in Garipov et al., "Loss Surfaces, Mode Connectivity, and Fast Ensembling of
    DNNs", NeurIPS'18
    """

class BaggingAutoencoderNeqModel(SnapshotAutoencoderNeqModel):
    """
    Bagging, i.e., training data for each member model is sampled with
    replacement
    """


class AdaBoostAutoencoderNeqModel(nn.Module):
    """
    AdaBoost ensemble of autoencoder models based on AdaBoost.R2 from
    Drucker, “Improving Regressors using Boosting Techniques”, 1997.
    """
    def __init__(
        self, 
        config, 
        num_train_samples,
        input_length=64, 
        output_length=16,
        num_models=4,
        single_model_mode=False,
    ):
        super(AdaBoostAutoencoderNeqModel, self).__init__()
        self.shape = (1, 8, 8)  # PyTorch defaults to (C, H, W)
        self.val_sum = None
        # TODO: Fix num neurons to match ensemble size for verilog testing?
        self.num_neurons = [input_length] + config["hidden_layer"] + [output_length]
        self.num_models = num_models
        self.single_model_mode = single_model_mode
        self.num_train_samples = num_train_samples # N
        # Training sample weights
        self.weights = torch.ones(self.num_train_samples) * 1 / self.num_train_samples
        self.model_weights = []
        # Build matrix of each encoder's output on the training data
        # self.fitted_encoder_values = torch.empty((self.num_train_samples, self.num_models))
        self.betas = []
        # Snapshot ensemble builds the ensemble as it trains. We will save
        # snapshots of encoder to encoder_ensemble list to build the ensemble
        self.encoder = EncoderNeqModel(
            config, input_length=input_length, output_length=output_length
        )
        # Init model differently if training vs finetuning/evaluating
        if self.single_model_mode:
            print("Init in single_model_mode mode!")
            self.encoder_ensemble = nn.ModuleList()
        else:
            print("Init in ensemble mode!")
            # Build the ensemble (for evaluation or finetuning)
            self.encoder_ensemble = nn.ModuleList([
                EncoderNeqModel(
                    config, input_length=input_length, output_length=output_length
                ) 
                for _ in range(num_models)
            ])
        self.decoder = Decoder(128)
        self.is_verilog_inference = False

    def update_betas(self, model_err):
        # Calculate beta
        beta = model_err / (1 - model_err)
        self.betas.append(beta)
        return beta
    
    def update_sample_weights(self, beta, observation_errors):
        # Reweight sample weights
        z = torch.sum(self.weights * beta ** (1 - observation_errors))
        self.weights = self.weights * beta ** (1 - observation_errors) / z

    def update_model_weights(self):
        self.model_weights = torch.log(1 / torch.Tensor(self.betas))
        return self.model_weights

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
    
    def forward(self, x):
        if self.is_verilog_inference:
            return self.verilog_forward(x)
        return self.pytorch_forward(x)
    
    def pytorch_forward(self, x):
        if self.single_model_mode:
            return self.decoder(self.encoder(x))
        # Else evaluate on the full ensemble
        # For now use weighted average using model weights because unclear
        # how to use weighted median for encoded vectors...
        outputs = [encoder(x) * self.model_weights[i] for i, encoder in enumerate(self.encoder_ensemble)]
        avg_outputs = sum(outputs) / sum(self.model_weights)
        return self.decoder(avg_outputs)
    
    # TODO: Implement verilog_forward() and verilog_inference()
    def verilog_forward(self, x):
        outputs = [encoder.verilog_forward(x) for encoder in self.encoder_ensemble]
        outputs = outputs * self.model_weights
        avg_outputs = sum(outputs) / sum(self.model_weights)
        return self.decoder(avg_outputs)
    
    def verilog_inference(self, verilog_dir, top_module_filename, logfile=None, add_registers: bool = False):
        pass

    