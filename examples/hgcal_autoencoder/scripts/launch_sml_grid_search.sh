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


# Pareto models determined by avg EMD

# xlabs55
tmux new-session -d -s g00 "./scripts/run_sml_grid_search_exp.sh 0 ./grid_search_configs/avg_emd_medium_configs/config1"
tmux new-session -d -s g01 "./scripts/run_sml_grid_search_exp.sh 0 ./grid_search_configs/avg_emd_medium_configs/config2"
tmux new-session -d -s g02 "./scripts/run_sml_grid_search_exp.sh 0 ./grid_search_configs/avg_emd_medium_configs/config3"
tmux new-session -d -s g03 "./scripts/run_sml_grid_search_exp.sh 1 ./grid_search_configs/avg_emd_medium_configs/config4"
tmux new-session -d -s g04 "./scripts/run_sml_grid_search_exp.sh 1 ./grid_search_configs/avg_emd_small_configs/config1"
tmux new-session -d -s g05 "./scripts/run_sml_grid_search_exp.sh 1 ./grid_search_configs/avg_emd_small_configs/config2"
tmux new-session -d -s g06 "./scripts/run_sml_grid_search_exp.sh 2 ./grid_search_configs/avg_emd_small_configs/config3"
tmux new-session -d -s g07 "./scripts/run_sml_grid_search_exp.sh 2 ./grid_search_configs/avg_emd_small_configs/config4"
tmux new-session -d -s g08 "./scripts/run_sml_grid_search_exp.sh 2 ./grid_search_configs/avg_emd_small_configs/config5"
tmux new-session -d -s g09 "./scripts/run_sml_grid_search_exp.sh 2 ./grid_search_configs/avg_emd_small_configs/config6"

# tmux kill-session -t g00
# tmux kill-session -t g01
# tmux kill-session -t g02
# tmux kill-session -t g03
# tmux kill-session -t g04
# tmux kill-session -t g05
# tmux kill-session -t g06
# tmux kill-session -t g07
# tmux kill-session -t g08
# tmux kill-session -t g09

# Old top 3 models

# xlabs51
# tmux new-session -d -s g00 "./scripts/run_sml_grid_search_exp.sh 0 ./grid_search_configs/small_model_configs/config1"
# tmux new-session -d -s g01 "./scripts/run_sml_grid_search_exp.sh 0 ./grid_search_configs/small_model_configs/config2"
# tmux new-session -d -s g02 "./scripts/run_sml_grid_search_exp.sh 0 ./grid_search_configs/small_model_configs/config3"
# tmux new-session -d -s g03 "./scripts/run_sml_grid_search_exp.sh 1 ./grid_search_configs/small_model_configs/config4"
# tmux new-session -d -s g04 "./scripts/run_sml_grid_search_exp.sh 1 ./grid_search_configs/small_model_configs/config5"
# tmux new-session -d -s g05 "./scripts/run_sml_grid_search_exp.sh 1 ./grid_search_configs/small_model_configs/config6"
# tmux new-session -d -s g06 "./scripts/run_sml_grid_search_exp.sh 2 ./grid_search_configs/medium_model_configs/config1"
# tmux new-session -d -s g07 "./scripts/run_sml_grid_search_exp.sh 2 ./grid_search_configs/medium_model_configs/config2"
# tmux new-session -d -s g08 "./scripts/run_sml_grid_search_exp.sh 2 ./grid_search_configs/medium_model_configs/config3"

# xlabs55
# tmux new-session -d -s g00 "./scripts/run_sml_grid_search_exp.sh 0 ./grid_search_configs/medium_model_configs/config4"
# tmux new-session -d -s g01 "./scripts/run_sml_grid_search_exp.sh 0 ./grid_search_configs/medium_model_configs/config5"
# tmux new-session -d -s g02 "./scripts/run_sml_grid_search_exp.sh 0 ./grid_search_configs/medium_model_configs/config6"
# tmux new-session -d -s g03 "./scripts/run_sml_grid_search_exp.sh 1 ./grid_search_configs/large_model_configs/config1"
# tmux new-session -d -s g04 "./scripts/run_sml_grid_search_exp.sh 1 ./grid_search_configs/large_model_configs/config2"
# tmux new-session -d -s g05 "./scripts/run_sml_grid_search_exp.sh 1 ./grid_search_configs/large_model_configs/config3"
# tmux new-session -d -s g06 "./scripts/run_sml_grid_search_exp.sh 2 ./grid_search_configs/large_model_configs/config4"
# tmux new-session -d -s g07 "./scripts/run_sml_grid_search_exp.sh 2 ./grid_search_configs/large_model_configs/config5"
# tmux new-session -d -s g08 "./scripts/run_sml_grid_search_exp.sh 2 ./grid_search_configs/large_model_configs/config6"