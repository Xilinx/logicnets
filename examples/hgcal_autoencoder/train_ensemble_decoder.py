#  Copyright (c) 2021-2022, Xilinx, Inc.
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
import time
import yaml
import torch
import random
import datetime
import numpy as np
from tqdm import tqdm

from argparse import ArgumentParser

from dataset import HGCalAutoencoderDataset
from autoencoder import AutoencoderFloatModel
from training_methods import train, test
from telescope_pt import move_constants_to_gpu


def main(args):
    # Load hyperparameters config file
    with open(args.hparams_config, "r") as f:
        config = yaml.safe_load(f)
    # Set random seeds
    seed = config["seed"]
    random.seed(seed)
    np.random.seed(seed)
    torch.manual_seed(seed)
    os.environ['PYTHONHASHSEED'] = str(seed)
    if args.gpu:
        torch.cuda.manual_seed_all(seed)
        torch.backends.cudnn.deterministic = True
    print(f"Global seed set to {seed}!")

    # Create experiment directory
    experiment_dir = os.path.join(args.save_dir, args.experiment_name)
    os.makedirs(experiment_dir, exist_ok=True)
    
    # Fetch datasets
    dataset = {}
    dataset["train"] = HGCalAutoencoderDataset(
        args.data_file, 
        data_dir=args.data_dir, 
        process_data=args.process_data, # Only need to pass once
        split="train",
    ) 
    dataset["valid"] = HGCalAutoencoderDataset(
        args.data_file, 
        data_dir=args.data_dir, 
        split="test",
    ) 
    dataset["test"] = HGCalAutoencoderDataset(
        args.data_file, 
        data_dir=args.data_dir, 
        split="test",
    )

    # Build model
    model = AutoencoderFloatModel(config)

     # Push model and constants to GPU if necessary
    if args.gpu:
        model.cuda()
        move_constants_to_gpu()

    # Train
    if args.train:
        if args.checkpoint:
            print(f"Loading pre-trained checkpoint: {args.checkpoint}")
            checkpoint = torch.load(args.checkpoint) 
            model.load_state_dict(checkpoint["model_dict"])
        train_params = {
            "gpu": args.gpu,
            "wd": config["wd"],
            "lr": config["lr"],
            "epochs": config["epochs"],
            "num_workers": args.num_workers,
            "experiment_dir": experiment_dir,
            "batch_size": config["batch_size"],
            "warm_restart_freq": config["warm_restart_freq"],
        }
        hparams_log = os.path.join(experiment_dir,"hparams.yml")
        with open(hparams_log, "w") as f:
            yaml.dump(config, f)
        
        train(model, dataset, train_params)

    # Evaluate model
    evaluate_model = False
    if args.evaluate:
        if args.checkpoint:
            # Evaluate given checkpoint
            evaluate_model = True
            print(f"Evaluating model saved at: {args.checkpoint}")
            checkpoint = torch.load(args.checkpoint) 
            # learning methods
            model.load_state_dict(checkpoint["model_dict"])
        else:
            raise ValueError(
                "No checkpoint provided for evaluation. " \
                "Provide a path to checkpoint argument, " \
                "i.e., --checkpoint CHECKPOINT_PATH"
            ) 
    elif args.train:
        evaluate_model = True 
        ckpt_path = os.path.join(experiment_dir, 'best_loss.pth')
        print(f"Evaluating best model saved at: {ckpt_path}")
        best_checkpoint = torch.load(ckpt_path)
        model.load_state_dict(best_checkpoint["model_dict"])
        # Make sure decoder model_dict is saved
        checkpoint = {
            "model_dict": model.state_dict(),
            "decoder_model_dict": model.decoder.state_dict(),
        }
        torch.save(checkpoint, os.path.join(experiment_dir, "best_loss.pth"))

    if evaluate_model:
        print("Evaluating model")
        # Need val_sum to compute EMD
        _, val_sum = dataset["test"].get_val_max_and_sum()
        test_loader = torch.utils.data.DataLoader(
            dataset["test"], 
            num_workers=args.num_workers, 
            batch_size=config["batch_size"], 
            pin_memory=True,
            shuffle=False, 
        )
        test_loss, avg_emd = test(
            model, test_loader, val_sum, args.gpu, compute_emd=True,
        )
        eval_tag = "_eval" if args.evaluate else ""
        os.makedirs(experiment_dir, exist_ok=True)
        test_results_log = os.path.join(
            experiment_dir, 
            args.experiment_name \
            + f"_loss={test_loss:.3f}" + eval_tag + "_emd.txt"
        )
        with open(test_results_log, "w") as f:
            f.write(str(avg_emd))
            f.close()



if __name__ == "__main__":
    parser = ArgumentParser()
    # Dataset args
    parser.add_argument("--data_dir", type=str, default=None)
    parser.add_argument("--data_file", type=str, default="data.npy")
    parser.add_argument("--process_data", action="store_true", default=False)
    parser.add_argument("--num_workers", type=int, default=8)
    parser.add_argument("--save_dir", type=str, default="./autoencoder_test")
    parser.add_argument("--experiment_name", type=str, default="autoencoder")
    parser.add_argument("--gpu", action="store_true", default=False)
    parser.add_argument("--train", action="store_true", default=False)
    parser.add_argument("--evaluate", action="store_true", default=False)
    parser.add_argument(
        "--hparams_config", 
        type=str, 
        default=None, 
        help="yaml containing hyperparameters for building and training a model"
    )
    parser.add_argument(
        "--checkpoint", 
        type=str, 
        default=None, 
        help="model checkpoint"
    )

    args = parser.parse_args()
    main(args)
