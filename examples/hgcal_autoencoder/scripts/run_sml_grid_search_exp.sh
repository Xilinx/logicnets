#!/bin/bash

CUDA_DEVICE=$1
CONFIG_DIR=$2

DATA_DIR=./data/hgcal22data_signal_driven_ttbar_v11/nElinks_5/
DATA_FILE=./data/hgcal22data_signal_driven_ttbar_v11/hgcal22data_signal_driven_ttbar_v11_nELinks5.npy 
SAVE_DIR=./sml_avg_emd_hp_grid_search

for config in `ls $CONFIG_DIR`; do
exp_name="${config%.*}"
echo $exp_name

CUDA_VISIBLE_DEVICES=$CUDA_DEVICE python3 train.py \
    --data_dir $DATA_DIR \
    --data_file $DATA_FILE \
    --save_dir $SAVE_DIR \
    --experiment_name $exp_name \
    --train \
    --gpu \
    --hparams_config "${CONFIG_DIR}/${config}"
done