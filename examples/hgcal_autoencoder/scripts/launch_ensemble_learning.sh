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


# xlabs51
# Averaging
# large model
# tmux new-session -d -s e00 "./scripts/run_ensemble_exp.sh 0 ./ensemble_configs/averaging/medium_configs/config1"
# tmux new-session -d -s e01 "./scripts/run_ensemble_exp.sh 0 ./ensemble_configs/averaging/medium_configs/config2"
# tmux new-session -d -s e02 "./scripts/run_ensemble_exp.sh 1 ./ensemble_configs/averaging/medium_configs/config3"
# tmux new-session -d -s e03 "./scripts/run_ensemble_exp.sh 1 ./ensemble_configs/averaging/medium_configs/config4"
# tmux new-session -d -s e04 "./scripts/run_ensemble_exp.sh 2 ./ensemble_configs/averaging/medium_configs/config5"
# tmux new-session -d -s e05 "./scripts/run_ensemble_exp.sh 2 ./ensemble_configs/averaging/medium_configs/config6"

# small model
# tmux new-session -d -s s00 "./scripts/run_ensemble_exp.sh 0 ./ensemble_configs/averaging/small_configs/config1"
# tmux new-session -d -s s01 "./scripts/run_ensemble_exp.sh 0 ./ensemble_configs/averaging/small_configs/config2"
# tmux new-session -d -s s02 "./scripts/run_ensemble_exp.sh 1 ./ensemble_configs/averaging/small_configs/config3"
# tmux new-session -d -s s03 "./scripts/run_ensemble_exp.sh 1 ./ensemble_configs/averaging/small_configs/config4"
# tmux new-session -d -s s04 "./scripts/run_ensemble_exp.sh 2 ./ensemble_configs/averaging/small_configs/config5"
# tmux new-session -d -s s05 "./scripts/run_ensemble_exp.sh 2 ./ensemble_configs/averaging/small_configs/config6"

# medium model
# xlabs53
# tmux new-session -d -s a00 "./scripts/run_gen_ensemble_exp.sh 0 ./ensemble_configs/averaging/medium_fr_configs/config1 ./voting"
# tmux new-session -d -s a01 "./scripts/run_gen_ensemble_exp.sh 0 ./ensemble_configs/averaging/medium_fr_configs/config2 ./voting"
# tmux new-session -d -s a02 "./scripts/run_gen_ensemble_exp.sh 0 ./ensemble_configs/averaging/medium_fr_configs/config3 ./voting"
# tmux new-session -d -s a03 "./scripts/run_gen_ensemble_exp.sh 1 ./ensemble_configs/averaging/medium_fr_configs/config4 ./voting"
# tmux new-session -d -s a04 "./scripts/run_gen_ensemble_exp.sh 1 ./ensemble_configs/averaging/medium_fr_configs/config5 ./voting"
# tmux new-session -d -s a05 "./scripts/run_gen_ensemble_exp.sh 1 ./ensemble_configs/averaging/medium_fr_configs/config6 ./voting"

# FGE
# tmux new-session -d -s f00 "./scripts/run_gen_ensemble_exp.sh 0 ./ensemble_configs/fge/small_configs/config1 ./fge"
# tmux new-session -d -s f01 "./scripts/run_gen_ensemble_exp.sh 0 ./ensemble_configs/fge/small_configs/config2 ./fge"
# tmux new-session -d -s f02 "./scripts/run_gen_ensemble_exp.sh 0 ./ensemble_configs/fge/small_configs/config3 ./fge"
# tmux new-session -d -s f03 "./scripts/run_gen_ensemble_exp.sh 1 ./ensemble_configs/fge/medium_configs/config1 ./fge"
# tmux new-session -d -s f04 "./scripts/run_gen_ensemble_exp.sh 1 ./ensemble_configs/fge/medium_configs/config2 ./fge"
# tmux new-session -d -s f05 "./scripts/run_gen_ensemble_exp.sh 1 ./ensemble_configs/fge/medium_configs/config3 ./fge"
# tmux new-session -d -s f06 "./scripts/run_gen_ensemble_exp.sh 2 ./ensemble_configs/fge/large_configs/config1 ./fge"
# tmux new-session -d -s f07 "./scripts/run_gen_ensemble_exp.sh 2 ./ensemble_configs/fge/large_configs/config2 ./fge"
# tmux new-session -d -s f08 "./scripts/run_gen_ensemble_exp.sh 2 ./ensemble_configs/fge/large_configs/config3 ./fge"

# Adaboost
tmux new-session -d -s a00 "./scripts/run_gen_ensemble_exp.sh 0 ./ensemble_configs/adaboost/small_configs/config1 ./adaboost"
tmux new-session -d -s a01 "./scripts/run_gen_ensemble_exp.sh 0 ./ensemble_configs/adaboost/small_configs/config2 ./adaboost"
tmux new-session -d -s a02 "./scripts/run_gen_ensemble_exp.sh 0 ./ensemble_configs/adaboost/small_configs/config3 ./adaboost"

tmux new-session -d -s a03 "./scripts/run_gen_ensemble_exp.sh 1 ./ensemble_configs/adaboost/medium_configs/config1 ./adaboost"
tmux new-session -d -s a04 "./scripts/run_gen_ensemble_exp.sh 1 ./ensemble_configs/adaboost/medium_configs/config2 ./adaboost"
tmux new-session -d -s a05 "./scripts/run_gen_ensemble_exp.sh 1 ./ensemble_configs/adaboost/medium_configs/config3 ./adaboost"

tmux new-session -d -s a06 "./scripts/run_gen_ensemble_exp.sh 2 ./ensemble_configs/adaboost/large_configs/config1 ./adaboost"
tmux new-session -d -s a07 "./scripts/run_gen_ensemble_exp.sh 2 ./ensemble_configs/adaboost/large_configs/config2 ./adaboost"
tmux new-session -d -s a08 "./scripts/run_gen_ensemble_exp.sh 2 ./ensemble_configs/adaboost/large_configs/config3 ./adaboost"

# xlabs55

# Snapshot (SSE)
# tmux new-session -d -s sse00 "./scripts/run_gen_ensemble_exp.sh 0 ./ensemble_configs/sse/large_configs/config1 ./sse"
# tmux new-session -d -s sse01 "./scripts/run_gen_ensemble_exp.sh 0 ./ensemble_configs/sse/large_configs/config2 ./sse"
# tmux new-session -d -s sse02 "./scripts/run_gen_ensemble_exp.sh 1 ./ensemble_configs/sse/large_configs/config3 ./sse"
# tmux new-session -d -s sse03 "./scripts/run_gen_ensemble_exp.sh 1 ./ensemble_configs/sse/large_configs/config4 ./sse"
# tmux new-session -d -s sse04 "./scripts/run_gen_ensemble_exp.sh 1 ./ensemble_configs/sse/small_configs/config1 ./sse"
# tmux new-session -d -s sse05 "./scripts/run_gen_ensemble_exp.sh 2 ./ensemble_configs/sse/small_configs/config2 ./sse"
# tmux new-session -d -s sse06 "./scripts/run_gen_ensemble_exp.sh 2 ./ensemble_configs/sse/small_configs/config3 ./sse"
# tmux new-session -d -s sse07 "./scripts/run_gen_ensemble_exp.sh 2 ./ensemble_configs/sse/small_configs/config4 ./sse"

# SSE finetuning
# tmux new-session -d -s ft00 "./scripts/run_gen_ensemble_exp.sh 0 ./ensemble_configs/sse/large_ft_configs/config1 ./sse"
# tmux new-session -d -s ft01 "./scripts/run_gen_ensemble_exp.sh 0 ./ensemble_configs/sse/large_ft_configs/config2 ./sse"
# tmux new-session -d -s ft02 "./scripts/run_gen_ensemble_exp.sh 0 ./ensemble_configs/sse/large_ft_configs/config3 ./sse"
# tmux new-session -d -s ft03 "./scripts/run_gen_ensemble_exp.sh 1 ./ensemble_configs/sse/large_ft_configs/config4 ./sse"
# tmux new-session -d -s ft033 "./scripts/run_gen_ensemble_exp.sh 1 ./ensemble_configs/sse/large_ft_configs/config5 ./sse"
# tmux new-session -d -s ft04 "./scripts/run_gen_ensemble_exp.sh 1 ./ensemble_configs/sse/small_ft_configs/config1 ./sse"
# tmux new-session -d -s ft05 "./scripts/run_gen_ensemble_exp.sh 1 ./ensemble_configs/sse/small_ft_configs/config2 ./sse"
# tmux new-session -d -s ft06 "./scripts/run_gen_ensemble_exp.sh 2 ./ensemble_configs/sse/small_ft_configs/config3 ./sse"
# tmux new-session -d -s ft07 "./scripts/run_gen_ensemble_exp.sh 2 ./ensemble_configs/sse/small_ft_configs/config4 ./sse"
# tmux new-session -d -s ft08 "./scripts/run_gen_ensemble_exp.sh 2 ./ensemble_configs/sse/small_ft_configs/config5 ./sse"

# SSE more epochs + finetuning
# tmux new-session -d -s m00 "./scripts/run_gen_ensemble_exp.sh 0 ./ensemble_configs/sse/large_more_epochs_configs/config1 ./sse_more_epochs"
# tmux new-session -d -s m01 "./scripts/run_gen_ensemble_exp.sh 0 ./ensemble_configs/sse/large_more_epochs_configs/config2 ./sse_more_epochs"
# tmux new-session -d -s m02 "./scripts/run_gen_ensemble_exp.sh 0 ./ensemble_configs/sse/large_more_epochs_configs/config3 ./sse_more_epochs"
# tmux new-session -d -s m03 "./scripts/run_gen_ensemble_exp.sh 1 ./ensemble_configs/sse/medium_more_epochs_configs/config1 ./sse_more_epochs"
# tmux new-session -d -s m04 "./scripts/run_gen_ensemble_exp.sh 1 ./ensemble_configs/sse/medium_more_epochs_configs/config2 ./sse_more_epochs"
# tmux new-session -d -s m05 "./scripts/run_gen_ensemble_exp.sh 1 ./ensemble_configs/sse/medium_more_epochs_configs/config3 ./sse_more_epochs"
# tmux new-session -d -s m06 "./scripts/run_gen_ensemble_exp.sh 2 ./ensemble_configs/sse/small_more_epochs_configs/config1 ./sse_more_epochs"
# tmux new-session -d -s m07 "./scripts/run_gen_ensemble_exp.sh 2 ./ensemble_configs/sse/small_more_epochs_configs/config2 ./sse_more_epochs"
# tmux new-session -d -s m08 "./scripts/run_gen_ensemble_exp.sh 2 ./ensemble_configs/sse/small_more_epochs_configs/config3 ./sse_more_epochs"