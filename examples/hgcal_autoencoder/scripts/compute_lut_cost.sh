#!/bin/bash

CONFIG_DIR=$1

DATA_DIR=./data/hgcal22data_signal_driven_ttbar_v11/nElinks_5/
DATA_FILE=./data/hgcal22data_signal_driven_ttbar_v11/hgcal22data_signal_driven_ttbar_v11_nELinks5.npy 
SAVE_DIR=./hp_random_search

for config in `ls $CONFIG_DIR`; do
if [[ $config != "search_config.yml" ]]; then
exp_name="${config%.*}"
echo $exp_name

python3 train.py \
    --data_dir $DATA_DIR \
    --data_file $DATA_FILE \
    --save_dir $SAVE_DIR \
    --experiment_name $exp_name \
    --hparams_config "${CONFIG_DIR}/${config}"
fi
done