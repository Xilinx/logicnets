#!/bin/bash

CUDA_DEVICE=$1
SEED=$2

DATA_DIR=./data/hgcal22data_signal_driven_ttbar_v11/nElinks_5/
DATA_FILE=./data/hgcal22data_signal_driven_ttbar_v11/hgcal22data_signal_driven_ttbar_v11_nELinks5.npy 
SAVE_DIR=./pipecleaner
EXP_NAME="hgcal_float${SEED}"
CKPT="./pipecleaner/hgcal_float1/best_loss.pth"
EPOCHS=1


CUDA_VISIBLE_DEVICES=$CUDA_DEVICE python3 train.py \
   --data_dir $DATA_DIR \
   --data_file $DATA_FILE \
   --save_dir $SAVE_DIR \
   --experiment_name $EXP_NAME \
   --checkpoint $CKPT \
   --seed $SEED \
   --evaluate \
   --gpu \