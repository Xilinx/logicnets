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


num_dense_feat=(128)
ifan=(1 3)
ofan=(1 3)
inp_bits=(3 5)
act1_bits=(2 4)
act2_bits=(2 4)
wds=(0.1) 
for n in ${num_dense_feat[@]}; do 
for if in ${ifan[@]}; do
for of in ${ofan[@]}; do 
for ibits in ${inp_bits[@]}; do 
for a1bits in ${act1_bits[@]}; do 
for a2bits in ${act2_bits[@]}; do 
for wd in ${wds[@]}; do 
    command="\"../../../docker/run-docker-gpu.sh; ./scripts/run_hp_search_exp.sh X 0 ${n} ${if} ${of} ${ibits} ${a1bits} ${a2bits} ${wd}\""
    echo $command
done
done
done
done
done
done
done


# tmux new-session -d -s h11 "../../docker/run-docker-gpu.sh; ./scripts/run_hp_search_exp.sh X 0 128 1 3 3 4 4 0.1"
# tmux new-session -d -s h12 "../../docker/run-docker-gpu.sh; ./scripts/run_hp_search_exp.sh X 0 128 1 3 5 2 2 0.1"
# tmux new-session -d -s h13 "../../docker/run-docker-gpu.sh; ./scripts/run_hp_search_exp.sh X 0 128 1 3 5 2 4 0.1"
# tmux new-session -d -s h14 "../../docker/run-docker-gpu.sh; ./scripts/run_hp_search_exp.sh X 0 128 1 3 5 4 2 0.1"
# tmux new-session -d -s h15 "../../docker/run-docker-gpu.sh; ./scripts/run_hp_search_exp.sh X 0 128 1 3 5 4 4 0.1"
# tmux new-session -d -s h16 "../../docker/run-docker-gpu.sh; ./scripts/run_hp_search_exp.sh X 0 128 3 1 3 2 2 0.1"
# tmux new-session -d -s h17 "../../docker/run-docker-gpu.sh; ./scripts/run_hp_search_exp.sh X 0 128 3 1 3 2 4 0.1"
# tmux new-session -d -s h18 "../../docker/run-docker-gpu.sh; ./scripts/run_hp_search_exp.sh X 0 128 3 1 3 4 2 0.1"
# tmux new-session -d -s h19 "../../docker/run-docker-gpu.sh; ./scripts/run_hp_search_exp.sh X 0 128 3 1 3 4 4 0.1"

# tmux new-session -d -s h20 "../../docker/run-docker-gpu.sh; ./scripts/run_hp_search_exp.sh X 0 128 3 1 5 2 2 0.1"
# tmux new-session -d -s h21 "../../docker/run-docker-gpu.sh; ./scripts/run_hp_search_exp.sh X 0 128 3 1 5 2 4 0.1"
# tmux new-session -d -s h22 "../../docker/run-docker-gpu.sh; ./scripts/run_hp_search_exp.sh X 0 128 3 1 5 4 2 0.1"
# tmux new-session -d -s h23 "../../docker/run-docker-gpu.sh; ./scripts/run_hp_search_exp.sh X 0 128 3 1 5 4 4 0.1"
# tmux new-session -d -s h24 "../../docker/run-docker-gpu.sh; ./scripts/run_hp_search_exp.sh X 0 128 3 3 3 2 2 0.1"
# tmux new-session -d -s h25 "../../docker/run-docker-gpu.sh; ./scripts/run_hp_search_exp.sh X 0 128 3 3 3 2 4 0.1"
# tmux new-session -d -s h26 "../../docker/run-docker-gpu.sh; ./scripts/run_hp_search_exp.sh X 0 128 3 3 3 4 2 0.1"
# tmux new-session -d -s h27 "../../docker/run-docker-gpu.sh; ./scripts/run_hp_search_exp.sh X 0 128 3 3 3 4 4 0.1"
# tmux new-session -d -s h28 "../../docker/run-docker-gpu.sh; ./scripts/run_hp_search_exp.sh X 0 128 3 3 5 2 2 0.1"
# tmux new-session -d -s h29 "../../docker/run-docker-gpu.sh; ./scripts/run_hp_search_exp.sh X 0 128 3 3 5 2 4 0.1"
# tmux new-session -d -s h30 "../../docker/run-docker-gpu.sh; ./scripts/run_hp_search_exp.sh X 0 128 3 3 5 4 2 0.1"
# tmux new-session -d -s h31 "../../docker/run-docker-gpu.sh; ./scripts/run_hp_search_exp.sh X 0 128 3 3 5 4 4 0.1"