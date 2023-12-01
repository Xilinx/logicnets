#!/bin/bash

# xlabs51
tmux new-session -d -s l01 "./scripts/compute_lut_cost.sh ./hp_configs/hparams1"
tmux new-session -d -s l02 "./scripts/compute_lut_cost.sh ./hp_configs/hparams2"
tmux new-session -d -s l03 "./scripts/compute_lut_cost.sh ./hp_configs/hparams3"
tmux new-session -d -s l04 "./scripts/compute_lut_cost.sh ./hp_configs/hparams4"
tmux new-session -d -s l05 "./scripts/compute_lut_cost.sh ./hp_configs/hparams5"
tmux new-session -d -s l06 "./scripts/compute_lut_cost.sh ./hp_configs/hparams6"
tmux new-session -d -s l07 "./scripts/compute_lut_cost.sh ./hp_configs/hparams7"
tmux new-session -d -s l08 "./scripts/compute_lut_cost.sh ./hp_configs/hparams8"
tmux new-session -d -s l09 "./scripts/compute_lut_cost.sh ./hp_configs/hparams9"

tmux new-session -d -s l11 "./scripts/compute_lut_cost.sh ./hp_configs/hparams10"
tmux new-session -d -s l12 "./scripts/compute_lut_cost.sh ./hp_configs/hparams11"
tmux new-session -d -s l13 "./scripts/compute_lut_cost.sh ./hp_configs/hparams12"
tmux new-session -d -s l14 "./scripts/compute_lut_cost.sh ./hp_configs/hparams13"
tmux new-session -d -s l15 "./scripts/compute_lut_cost.sh ./hp_configs/hparams14"
tmux new-session -d -s l16 "./scripts/compute_lut_cost.sh ./hp_configs/hparams15"
tmux new-session -d -s l17 "./scripts/compute_lut_cost.sh ./hp_configs/hparams16"
tmux new-session -d -s l18 "./scripts/compute_lut_cost.sh ./hp_configs/hparams17"
tmux new-session -d -s l19 "./scripts/compute_lut_cost.sh ./hp_configs/hparams18"

# tmux kill-session -t r49
# tmux kill-session -t r50
# tmux kill-session -t r51
# tmux kill-session -t r52
# tmux kill-session -t r53
# tmux kill-session -t r54
# tmux kill-session -t r55
# tmux kill-session -t r56
# tmux kill-session -t r57