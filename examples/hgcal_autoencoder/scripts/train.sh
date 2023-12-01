#!/bin/bash

CUDA_DEVICE=$1

DATA_DIR=./data/hgcal22data_signal_driven_ttbar_v11/nElinks_5/
DATA_FILE=./data/hgcal22data_signal_driven_ttbar_v11/hgcal22data_signal_driven_ttbar_v11_nELinks5.npy 
SAVE_DIR=./voting
EXP_NAME=hparam8_1916071045
CONFIG=./ensemble_configs/hparam8_1916071045.yml

CUDA_VISIBLE_DEVICES=$CUDA_DEVICE python3 train.py \
    --data_dir $DATA_DIR \
    --data_file $DATA_FILE \
    --save_dir $SAVE_DIR \
    --experiment_name $EXP_NAME \
    --train \
    --gpu \
    --hparams_config $CONFIG
    # --process_data # Only need to run once