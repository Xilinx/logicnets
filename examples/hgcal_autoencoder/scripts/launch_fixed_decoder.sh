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


tmux new-session -d -s f00 "./scripts/run_fixed_decoder_exp.sh 0 ./ensemble_configs/decoder/config1 ./fixed_decoder"
tmux new-session -d -s f01 "./scripts/run_fixed_decoder_exp.sh 0 ./ensemble_configs/decoder/config2 ./fixed_decoder"
tmux new-session -d -s f02 "./scripts/run_fixed_decoder_exp.sh 1 ./ensemble_configs/decoder/config3 ./fixed_decoder"