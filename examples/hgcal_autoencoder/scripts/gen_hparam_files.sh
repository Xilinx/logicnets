#!/bin/bash

# HP_SEED=62 # Change each time want new random search configs
# HP_SEED=48
# HP_SEED=24
HP_SEED=0 # Prev
NUM_NODES=18

for i in `seq 1 1 $NUM_NODES`; do
seed=$(( $i + $HP_SEED ))
python3 random_search.py -s $seed -c search_configs/search_config.yml -d hp_configs
done
