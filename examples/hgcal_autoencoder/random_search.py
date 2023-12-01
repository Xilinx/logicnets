import os
import copy
import yaml
import math
import random
import itertools
import numpy as np

from argparse import ArgumentParser

"""
Create hyperparameter yaml files for random search

Example yaml:

hidden_layers:
    - 64
    - 128
    - 32
activation_bitwidths:
    - 2
    - 3
    - 3
neuron_fanin:
    - 5
    - 4
    - 4
batch_size: 512
epochs: 100
gpu: true
input_bitwidth: 4
output_bitwidth: 4
output_fanin: 5
lr: 0.001
warm_restart_freq: 50
wd: 0.1

"""

MAX_FANIN = 16

def get_num_feat_opts(config):
    num_features_log2_lo = int(math.log2(config["num_features"]["min"]))
    num_features_log2_hi = int(math.log2(config["num_features"]["max"]))
    num_features_choices = 2 ** np.arange(num_features_log2_lo, num_features_log2_hi + 1)
    return num_features_choices

def get_bitwidth_and_fanin_opts(config, bit_key, fanin_key):
    """
    Create all possible pairs of input/activation bitwidth and fanin with total
    fanin <= MAX_FANIN
    """
    bit_fanin_pairs = [] # List of (bitwidth, fanin)
    bitwidths = np.arange(config[bit_key]["min"], config[bit_key]["max"] + 1)
    fanins = np.arange(config[fanin_key]["min"], config[fanin_key]["max"] + 1)

    bit_fanin_pairs = list(itertools.product(bitwidths, fanins))
    bit_fanin_pairs = [p for p in bit_fanin_pairs if p[0] * p[1] <= MAX_FANIN]
    return bit_fanin_pairs

def sample_scaled_fanin(config, key, fanin_factor, rng):
    """
    Scale down fanin opts based on previous chosen fanin factor
    """
    fanin_hi = MAX_FANIN // fanin_factor
    fanin_hi = min(fanin_hi, config[key]["max"])
    return int(rng.integers(config[key]["min"], high=fanin_hi, endpoint=True))

def sample_random_int(config, key, rng):
    """
    Return sampled integer for given key
    """
    return int(rng.integers(config[key]["min"], high=config[key]["max"], endpoint=True))

def sample_uniform_dist(config, key, rng):
    """
    Sample from a uniform distribution within the range specified by the key in
    the config
    """
    return float(rng.uniform(low=config[key]["min"], high=config[key]["max"]))

def sample_loguniform_dist(config, key, rng):
    """
    Sample from a log uniform distribution within the range specified by the key
    in the config
    """
    min_val = math.log10(config[key]["min"])
    max_val = math.log10(config[key]["max"])
    return float(np.power(10, rng.uniform(min_val, max_val)))


def main(args):
    # Random search config
    with open(args.search_config, "r") as f:
        config = yaml.safe_load(f)

    # Set random seeds
    seed = args.seed
    random.seed(seed)
    np.random.seed(seed)
    os.environ['PYTHONHASHSEED'] = str(seed)
    print(f"Global seed set to {seed}!")

    rng = np.random.default_rng(seed=seed)

    # Make dir for storing yamls
    yaml_dir = os.path.join(args.config_dir, f"hparams{seed}")
    os.makedirs(yaml_dir, exist_ok=True)

    config["seed"] = args.seed
    search_file = os.path.join(yaml_dir, f"search_config.yml")
    with open(search_file, "w") as f:
        yaml.dump(config, f)

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

    # Number of features are powers of 2 for fast matrix multiplication
    num_feat_opts = get_num_feat_opts(config)
    # List of valid (bitwidth, fanin) pairs
    # inp_bit_fanin_pairs = get_bitwidth_and_fanin_opts(
    #     config, "input_bitwidth", "input_fanin",
    # )
    act_bit_fanin_pairs = get_bitwidth_and_fanin_opts(
        config, "activation_bitwidth", "neuron_fanin",
    )
    # Generate hparam files
    for i in range(config["num_trials"]):
        hparams = copy.deepcopy(default_hparams)
        if config["search_model_arch"]:
            # Number of hidden layers + num features per layer
            num_hidden_layers = sample_random_int(config, "hidden_layer", rng)
            # Skew input bitwidth to higher bitwidths
            hparams["input_bitwidth"] = sample_random_int(
                config, "input_bitwidth", rng
            )
            hparams["input_fanin"] = sample_scaled_fanin(
                config, "input_fanin", hparams["input_bitwidth"], rng
            )
            for _ in range(num_hidden_layers):  
                num_feat = int(random.choice(num_feat_opts))
                hparams["hidden_layer"].append(num_feat)
                act_bitwidth, act_fanin = random.choice(act_bit_fanin_pairs)
                hparams["activation_bitwidth"].append(int(act_bitwidth))
                hparams["neuron_fanin"].append(int(act_fanin))
            hparams["output_bitwidth"] = sample_scaled_fanin(
                config,
                "output_bitwidth", 
                hparams["neuron_fanin"][-1], 
                rng,
            )
        if config["search_learning_params"]:
            hparams["lr"] = sample_loguniform_dist(config, "lr", rng)
            hparams["wd"] = sample_loguniform_dist(config, "wd", rng)
            hparams["warm_restart_freq"] = sample_random_int(
                config, "warm_restart_freq", rng
            )
        # Generate copies of the hparam yaml with different random seeds
        rand_seeds = rng.integers(
            0, high=np.iinfo(np.int32).max, size=config["num_seeds_per_trial"],
        )
        for s in rand_seeds:
            s = int(s)
            hparams["seed"] = s
            file = os.path.join(yaml_dir, f"hparam{i + seed}_{s}.yml")
            print(f"Writing yaml to {file}")
            with open(file, "w") as f:
                yaml.dump(hparams, f)


if __name__ == "__main__":
    parser = ArgumentParser()
    parser.add_argument(
        "-s",
        "--seed",
        type=int,
        default=0,
        help="Random seed for hyperparameter generation",
    )
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
    args = parser.parse_args()
    main(args)
