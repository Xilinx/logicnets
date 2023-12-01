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


# HP_SEED=62 # Change each time want new random search configs
# HP_SEED=48
# HP_SEED=24
HP_SEED=0 # Prev
NUM_NODES=18

for i in `seq 1 1 $NUM_NODES`; do
seed=$(( $i + $HP_SEED ))
python3 random_search.py -s $seed -c search_configs/search_config.yml -d hp_configs
done
