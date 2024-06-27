#!/bin/bash
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
#  limitations under the License.


DATA_DIR=./data/hgcal22data_signal_driven_ttbar_v11/nElinks_5/
DATA_FILE=./data/hgcal22data_signal_driven_ttbar_v11/hgcal22data_signal_driven_ttbar_v11_nELinks5.npy 
SAVE_DIR=./hparams_config_test
EXP_NAME=pipecleaner
CONFIG=pipecleaner.yml
CKPT="./hparams_config_test/pipecleaner/best_loss.pth"


CUDA_VISIBLE_DEVICES="" python3 neq2lut.py \
   --data_dir $DATA_DIR \
   --data_file $DATA_FILE \
   --save_dir $SAVE_DIR \
   --experiment_name $EXP_NAME \
   --checkpoint $CKPT \
   --hparams_config $CONFIG \
   --simulate_pre_synthesis_verilog \
   --simulate_post_synthesis_verilog \
   --compute_emd \
   # --add_registers \
   # --gpu \