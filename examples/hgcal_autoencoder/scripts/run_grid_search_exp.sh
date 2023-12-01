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


CUDA_DEVICE=$1
SEED=$2
NUM_DENSE_FEAT=$3
WD=$4
INP_FANIN=$5
OUT_FANIN=$6
INP_BITS=$7
ACT1_BITS=$8
ACT2_BITS=$9

LR=0.001
T0=50
BATCH=512

DATA_DIR=./data/hgcal22data_signal_driven_ttbar_v11/nElinks_5/
DATA_FILE=./data/hgcal22data_signal_driven_ttbar_v11/hgcal22data_signal_driven_ttbar_v11_nELinks5.npy 
SAVE_DIR="./hp_search/hgcal${SEED}_qr${ACT1_BITS}_qi${ACT2_BITS}_ifan${INP_FANIN}_ofan${OUT_FANIN}"
EXP_NAME="dense${NUM_DENSE_FEAT}_lr${LR}_wd${WD}_t0${T0}"
EPOCHS=200


CUDA_VISIBLE_DEVICES=$CUDA_DEVICE python3 train.py \
    --data_dir $DATA_DIR \
    --data_file $DATA_FILE \
    --save_dir $SAVE_DIR \
    --experiment_name $EXP_NAME \
    --epochs $EPOCHS \
    --seed $SEED \
    --train \
    --learning_rate $LR \
    --weight_decay $WD \
    --warm_restart_freq $T0 \
    --batch_size $BATCH \
    --input_fanin $INP_FANIN \
    --output_fanin $OUT_FANIN \
    --qinput_bitwidth $INP_BITS \
    --act1_bitwidth $ACT1_BITS \
    --act2_bitwidth $ACT2_BITS \
    --num_dense_feat $NUM_DENSE_FEAT \
    --gpu \