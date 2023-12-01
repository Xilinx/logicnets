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
from autoencoder import AutoencoderNeqModel
from ensemble_models import VotingAutoencoderNeqModel, SnapshotAutoencoderNeqModel, FGEAutoencoderNeqModel, AdaBoostAutoencoderNeqModel
from telescope_pt import move_constants_to_gpu
from training_methods import train, test, train_snapshot_ensemble, train_fge, train_adaboost
from logicnets.nn import SparseLinearNeq

ENSEMBLING_METHODS = ["voting", "snapshot", "fge", "adaboost", "bagging"]


def get_lut_cost(model, experiment_dir, experiment_name):
    """
    Compute LUTCost of the given model
    """
    total_lut_cost = 0
    lut_cost_by_layer = {}
    for name, module in model.named_modules():
        if type(module) == SparseLinearNeq:
            lut_cost = module.lut_cost()
            print(f"{name} lut cost = {lut_cost}")
            lut_cost_by_layer[name] = lut_cost
            total_lut_cost = total_lut_cost + lut_cost
    # Log lut cost
    os.makedirs(experiment_dir, exist_ok=True)
    test_results_log = os.path.join(
        experiment_dir, 
        experiment_name + f"_lutcost.txt"
    )
    with open(test_results_log, "w") as f:
        for k in lut_cost_by_layer:
            f.write(f"{k} lut cost: {lut_cost_by_layer[k]}\n")
        f.write(f"Total LUT cost: {total_lut_cost}\n")
        f.close()
    return total_lut_cost


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
    # Extra ensemble hyperparameters
    if "finetune_epochs" in config.keys():
        finetune_epochs = config["finetune_epochs"]
    else:
        finetune_epochs = 0 # By default
    # FGA default hyperparameters
    cycle = 4
    lr1 = 1e-3
    lr2 = 1e-5
    ensemble_method = None
    # TODO: Rename voting to averaging
    if "ensemble_method" in config.keys():
        # Ensemble learning
        ensemble_method = config["ensemble_method"]
        ensemble_size = config["ensemble_size"]
        if ensemble_method == "voting":
            model = VotingAutoencoderNeqModel(config, num_models=ensemble_size)
        elif ensemble_method == "snapshot":
            model = SnapshotAutoencoderNeqModel(
                config, num_models=ensemble_size, single_model_mode=args.train,
            )
        elif ensemble_method == "fge":
            model = FGEAutoencoderNeqModel(
                config, num_models=ensemble_size, single_model_mode=args.train,
            )
            cycle = config["ensemble_hp"]["cycle"]
            lr1   = config["ensemble_hp"]["lr1"]
            lr2   = config["ensemble_hp"]["lr2"]
        # TODO: Instantiate other ensembles
        elif ensemble_method == "adaboost":
            model = AdaBoostAutoencoderNeqModel(
                config, 
                len(dataset["train"]), 
                num_models=ensemble_size,
                single_model_mode=args.train
            )
            independent = config["ensemble_hp"]["independent"]
        else:
            raise ValueError(f"Unsupported ensemble method: {ensemble_method}")
    else: # Single model learning
        # Build model
        model = AutoencoderNeqModel(config)
        # Compute LUTCost of whole model
        encoder_lut_cost = get_lut_cost(model.encoder, experiment_dir, args.experiment_name)
        print(f"Encoder LUTCost = {encoder_lut_cost}")

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
            "finetune_epochs": finetune_epochs,
            "warm_restart_freq": config["warm_restart_freq"],
            # Sequential ensemble learning hyperparemeter
            "independent": independent,
            # FGE hyperparameters
            "cycle": cycle,
            "lr1": lr1,
            "lr2": lr2,
        }
        hparams_log = os.path.join(
            experiment_dir,"hparams.yml"
        )
        with open(hparams_log, "w") as f:
            yaml.dump(config, f)
        if ensemble_method == "voting":
            train(model, dataset, train_params)
        elif ensemble_method == "snapshot":
            train_snapshot_ensemble(model, config, dataset, train_params)
        elif ensemble_method == "fge":
            train_fge(model, config, dataset, train_params)
        elif ensemble_method == "adaboost":
            train_adaboost(
                model, 
                config, 
                dataset, 
                train_params, 
                independent=independent,
            )
        # TODO: Implement other ensembling learning methods
        else:
            train(model, dataset, train_params)

    # Evaluate model
    evaluate_model = False
    if args.evaluate:
        if args.checkpoint:
            # Evaluate given checkpoint
            evaluate_model = True
            print(f"Evaluating model saved at: {args.checkpoint}")
            checkpoint = torch.load(args.checkpoint) 
            # TODO: Implement proper checkpoint loading for various ensemble
            # learning methods
            model.load_state_dict(checkpoint["model_dict"])
            if ensemble_method == "adaboost":
                model.model_weights = checkpoint["model_weights"]
                if args.gpu:
                    model.model_weights.cuda()
            if ensemble_method == "snapshot" or ensemble_method == "fge" or ensemble_method == "adaboost":
                model.single_model_mode = False
        else:
            raise ValueError("No checkpoint provided for evaluation. Provide a path to checkpoint argument, i.e., --checkpoint CHECKPOINT_PATH") 
    elif args.train:
        evaluate_model = True 
        if ensemble_method == "snapshot" or ensemble_method == "fge" or ensemble_method == "adaboost":
            print(f"Evaluating last ensemble saved at: {os.path.join(experiment_dir, 'last_ensemble_ckpt.pth')}")
            best_checkpoint = torch.load(os.path.join(experiment_dir, "last_ensemble_ckpt.pth"))
            model.load_state_dict(best_checkpoint["model_dict"])
            if ensemble_method == "adaboost":
                model.model_weights = best_checkpoint["model_weights"]
                if args.gpu:
                    model.model_weights.cuda()
            model.single_model_mode = False
        # TODO: Implement proper checkpoint loading for various ensemble
        else:
            print(f"Evaluating best model saved at: {os.path.join(experiment_dir, 'best_loss.pth')}")
            best_checkpoint = torch.load(os.path.join(experiment_dir, "best_loss.pth"))
            model.load_state_dict(best_checkpoint["model_dict"])

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
            args.experiment_name + f"_loss={test_loss:.3f}" + eval_tag + "_emd.txt"
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
