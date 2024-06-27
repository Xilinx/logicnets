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

import os
import copy
import yaml
import math
import random
import itertools
import numpy as np

from argparse import ArgumentParser

def main(args):
    # Grid search config
    with open(args.search_config, "r") as f:
        config = yaml.safe_load(f)

    # Make dir for storing yamls
    yaml_dir = os.path.join(args.config_dir)
    os.makedirs(yaml_dir, exist_ok=True)

    # Default hparams
    default_hparams = {
        "seed": None, 
        "hidden_layer": [],
        "neuron_fanin": [],
        "input_bitwidth": None,
        "input_fanin": None,
        "output_bitwidth": None,
        "activation_bitwidth": [],
        "warm_restart_freq": 50,
        "batch_size": 512,
        "epochs": 100,
        "lr": 0.001,
        "wd": 0.01,
    }

    # Populate fixed hyperparameters
    for k in config.keys():
        if k != "grid_search_params":
            default_hparams[k] = config[k]

    grid_search_param_keys = list(config["grid_search_params"].keys())
    grid_search_values = [] # List of lists containing hyperparameter values
    for k in grid_search_param_keys:
        grid_search_values.append(config["grid_search_params"][k])
    # Create grid
    grid = list(itertools.product(*grid_search_values))
    for cell in grid:
        exp_name = args.experiment_prefix
        hparams = copy.deepcopy(default_hparams)
        hparam_vals = zip(grid_search_param_keys, cell)
        for key, val in hparam_vals:
            hparams[key] = val
            exp_name += f"_{key}{val}"
        file = os.path.join(yaml_dir, f"{exp_name}.yml")
        print(f"Writing yaml to {file}")
        with open(file, "w") as f:
            yaml.dump(hparams, f)


if __name__ == "__main__":
    parser = ArgumentParser()
    parser.add_argument(
        "-c",
        "--search_config", 
        type=str, 
        default=None, 
        help="Configuration of the search ranges for each hyperparameter",
    )
    parser.add_argument(
        "-d",
        "--config_dir", 
        type=str, 
        default="./hp_configs", 
        help="Directory to store hyperparameter config files in",
    )
    parser.add_argument(
        "--experiment_prefix",
        type=str,
        default="autoencoder",
        help="prefix of experiment used to name generated config file",
    )
    args = parser.parse_args()
    main(args)
