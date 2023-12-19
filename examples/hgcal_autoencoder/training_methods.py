# Copyright (C) 2023, Advanced Micro Devices, Inc.
# Copyright (c) 2019 - 2023 The Ensemble-Pytorch developers.
# All rights reserved.

# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:

# * Redistributions of source code must retain the above copyright notice, this
#   list of conditions and the following disclaimer.

# * Redistributions in binary form must reproduce the above copyright notice,
#   this list of conditions and the following disclaimer in the documentation
#   and/or other materials provided with the distribution.

# * Neither the name of the copyright holder nor the names of its
#   contributors may be used to endorse or promote products derived from
#   this software without specific prior written permission.

# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
# FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
# DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
# SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
# CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
# OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
# OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

import os
import sys
import time
import math
import copy
import torch
import datetime
import numpy as np
from tqdm import tqdm
import multiprocessing
from torch.utils.tensorboard import SummaryWriter

from utils_pt import unnormalize, emd
from encoder import EncoderNeqModel
from decoder import Decoder
from ensemble_models import VotingAutoencoderNeqModel, AdaBoostAutoencoderNeqModel
from telescope_pt import telescopeMSE8x8

# TODO: Put each training method and associated functions in their own files

def test(model, test_loader, val_sum=None, gpu=False, compute_emd=False):
    """
    Testing loop

    Computing the EMD is expensive, so run it only when needed
    """
    model.eval()
    average_emd = -1
    input_calQ_list = []
    output_calQ_list = []
    with torch.no_grad():
        total_loss = 0.0
        for x in tqdm(test_loader):
            if gpu:
                x = x.cuda()
            output = model(x)
            loss = telescopeMSE8x8(x, output)
            total_loss = total_loss + loss.detach() * len(x)
            if compute_emd:
                assert val_sum is not None
                input_calQ = model.map_to_calq(x)
                output_calQ_fr = model.map_to_calq(output)
                input_calQ = torch.stack(
                    [input_calQ[i] * val_sum[i] for i in range(len(input_calQ))]
                )  # shape = (batch_size, 48)
                output_calQ = unnormalize(
                    torch.clone(output_calQ_fr), val_sum,
                )  # ae_out
                input_calQ_list.append(input_calQ)
                output_calQ_list.append(output_calQ)
        total_loss = total_loss / len(test_loader.dataset)
        
    if compute_emd:
        input_calQ = np.concatenate(
            [i_calQ.cpu() for i_calQ in input_calQ_list], axis=0,
        )
        output_calQ = np.concatenate(
            [o_calQ.cpu() for o_calQ in output_calQ_list], axis=0,
        )
        start_time = time.time()
        with multiprocessing.Pool() as pool:
            emd_list = pool.starmap(emd, zip(input_calQ, output_calQ))
        print(f"EMD computation time: {time.time() - start_time} seconds")
        average_emd = np.mean(np.array(emd_list))
        print(f"Average EMD: {average_emd}")
    return total_loss.detach().cpu().numpy(), average_emd

def train(model, dataset, params, sampler=None, optimizer=None):
    start_time = time.time()
    # Create data loaders for training and inference
    if sampler: 
        train_loader = torch.utils.data.DataLoader(
            dataset["train"], 
            num_workers=params["num_workers"], 
            batch_size=params["batch_size"], 
            pin_memory=True,
            shuffle=False,
            sampler=sampler,
        )
    else:
        train_loader = torch.utils.data.DataLoader(
            dataset["train"], 
            num_workers=params["num_workers"], 
            batch_size=params["batch_size"], 
            pin_memory=True,
            shuffle=True, 
        )
    val_loader = torch.utils.data.DataLoader(
        dataset["valid"], 
        num_workers=params["num_workers"], 
        batch_size=params["batch_size"], 
        pin_memory=True,
        shuffle=False, 
    )

    # Configure optimizer
    if not optimizer:
        optimizer = configure_optimizer(model, params)

    # Configure scheduler
    steps = len(train_loader)
    scheduler = torch.optim.lr_scheduler.CosineAnnealingWarmRestarts(
        optimizer, T_0=steps*params["warm_restart_freq"], T_mult=1,
    )

    # Configure criterion
    criterion = telescopeMSE8x8
    
    # Setup tensorboard
    writer = SummaryWriter(params["experiment_dir"])

    # Training loop
    min_loss = np.finfo(np.float32).max
    for epoch in range(0, params["epochs"]):
        model.train()
        total_loss = 0.0
        for x in tqdm(train_loader):
            if params["gpu"]:
                x = x.cuda()
            optimizer.zero_grad()
            x_hat = model(x)
            loss = criterion(x, x_hat)
            total_loss = total_loss + loss.detach() * len(x)
            loss.backward()
            optimizer.step()
            scheduler.step()
        total_loss = total_loss / len(train_loader.dataset)
        total_loss = total_loss.detach().cpu().numpy()
        writer.add_scalar("train_loss", total_loss, epoch)
        val_loss, _ = test(model, val_loader, gpu=params["gpu"])
        writer.add_scalar("val_loss", val_loss, epoch)
        checkpoint = {
            "model_dict": model.state_dict(),
            "decoder_model_dict": model.decoder.state_dict(),
            "optim_dict": optimizer.state_dict(),
            "val_loss": val_loss,
            "epoch": epoch,
        }
        if val_loss < min_loss:
            min_loss = val_loss
            for f in os.listdir(params["experiment_dir"]):
                if "checkpoint" in f:
                    os.remove(os.path.join(params["experiment_dir"], f))
            torch.save(
                checkpoint, 
                os.path.join(
                    params["experiment_dir"], 
                    f"checkpoint_epoch{epoch}_loss={val_loss:.3f}.pth"
                )
            )
            torch.save(
                checkpoint, 
                os.path.join(params["experiment_dir"], "best_loss.pth")
            )
        print(f"Epoch: {epoch + 1} / {params['epochs']}\tTrain Loss: {total_loss}\tVal Loss: {val_loss}")
    training_time = datetime.timedelta(seconds=(time.time() - start_time))
    print(f"Total training time: {str(training_time)}")


def snapshot_lr_scheduler(optimizer, num_iters, num_models):
    """
    Ref: https://github.com/TorchEnsemble-Community/Ensemble-Pytorch 
    Set the learning rate scheduler for snapshot ensemble.
    Please refer to the equation (2) in original paper for details.
    """
    T_M = math.ceil(num_iters / num_models)
    lr_lambda = lambda iteration: 0.5 * (  # noqa: E731
        torch.cos(torch.tensor(math.pi * (iteration % T_M) / T_M)) + 1
    )
    scheduler = torch.optim.lr_scheduler.LambdaLR(
        optimizer, lr_lambda=lr_lambda,
    )

    return scheduler

def finetune_decoder(model, dataset, params, writer=None):
    if not writer:
        writer = SummaryWriter(params["experiment_dir"])
    train_loader = torch.utils.data.DataLoader(
        dataset["train"], 
        num_workers=params["num_workers"], 
        batch_size=params["batch_size"], 
        pin_memory=True,
        shuffle=True, 
    )
    val_loader = torch.utils.data.DataLoader(
        dataset["valid"], 
        num_workers=params["num_workers"], 
        batch_size=params["batch_size"], 
        pin_memory=True,
        shuffle=False, 
    )
    print(f"Finetuning last ensemble saved at: {os.path.join(params['experiment_dir'], 'last_ensemble_ckpt.pth')}")
    best_checkpoint = torch.load(os.path.join(params['experiment_dir'], "last_ensemble_ckpt.pth"))
    model.load_state_dict(best_checkpoint["model_dict"])

    # Finetune in Ensemble mode
    model.single_model_mode = False
    # Freeze encoder params
    for name, param in model.encoder_ensemble.named_parameters():
        param.requires_grad = False
        print(f"Freeze param {name}")
    # Configure optimizer
    weight_decay = params["wd"]
    # Make a list of parameters name fragments which will ignore weight decay
    decay_exclusions = ["bn", "bias", "learned_value"] 
    decay_params = set()
    no_decay_params = set()
    for name, param in model.decoder.named_parameters():
        if param.requires_grad:
            no_decay_param_found = False
            for k in decay_exclusions:
                if k in name:
                    no_decay_params.add(param)
                    no_decay_param_found = True
                    print(f"Disabling weight decay for {name}")
            if not no_decay_param_found:
                decay_params.add(param)
                print(f"\tEnabling weight decay for {name}")
    model_params = [
        {
            'params': list(decay_params), 
            'weight_decay': weight_decay
        },
        {
            'params': list(no_decay_params), 
            'weight_decay': 0.0
        }
    ]
    optimizer =  torch.optim.AdamW(
        model_params, 
        lr=params["lr"], 
        weight_decay=weight_decay, 
        betas=(0.5, 0.999), 
    )
    # Configure criterion
    criterion = telescopeMSE8x8
    # Configure scheduler
    steps = len(train_loader)
    if params["finetune_epochs"] > 0:
        scheduler = torch.optim.lr_scheduler.CosineAnnealingWarmRestarts(
            optimizer, T_0=steps*params["finetune_epochs"], T_mult=1,
        )
    min_loss = np.finfo(np.float32).max
    for epoch in range(0, params["finetune_epochs"]):
        model.train()
        total_loss = 0.0
        for x in tqdm(train_loader):
            if params["gpu"]:
                x = x.cuda()
            optimizer.zero_grad()
            x_hat = model(x)
            loss = criterion(x, x_hat)
            total_loss = total_loss + loss.detach() * len(x)
            loss.backward()
            optimizer.step()
            scheduler.step()
        total_loss = total_loss / len(train_loader.dataset)
        total_loss = total_loss.detach().cpu().numpy()
        writer.add_scalar("train_loss", total_loss, epoch)
        val_loss, _ = test(model, val_loader, gpu=params["gpu"])
        writer.add_scalar("val_loss", val_loss, epoch)
        if val_loss < min_loss:
            checkpoint = {
                "model_dict": model.state_dict(),
                "optim_dict": optimizer.state_dict(),
                "val_loss": val_loss,
                "epoch": epoch,
            }
            if type(model) == AdaBoostAutoencoderNeqModel:
                checkpoint["sample_weights"] = model.weights
                checkpoint["model_weights"] = model.model_weights
            min_loss = val_loss
            torch.save(
                checkpoint, 
                os.path.join(params["experiment_dir"], "last_ensemble_ckpt.pth")
            )
        print(f"Finetune Epoch: {epoch + 1} / {params['finetune_epochs']}\tTrain Loss: {total_loss}\tVal Loss: {val_loss}")

def train_snapshot_ensemble(model, model_config, dataset, params):
    start_time = time.time()
    # Create data loaders for training and inference
    train_loader = torch.utils.data.DataLoader(
        dataset["train"], 
        num_workers=params["num_workers"], 
        batch_size=params["batch_size"], 
        pin_memory=True,
        shuffle=True, 
    )
    val_loader = torch.utils.data.DataLoader(
        dataset["valid"], 
        num_workers=params["num_workers"], 
        batch_size=params["batch_size"], 
        pin_memory=True,
        shuffle=False, 
    )
    # Need val_sum to compute EMD
    _, val_sum = dataset["test"].get_val_max_and_sum()
    test_loader = torch.utils.data.DataLoader(
        dataset["test"],
        num_workers=params["num_workers"], 
        batch_size=params["batch_size"],  
        pin_memory=True,
        shuffle=False, 
    )

    # Configure optimizer
    optimizer = configure_optimizer(model, params)

    # Configure scheduler NOTE: only if epochs is nonzero
    if params["epochs"] > 0:
        steps = len(train_loader) * params["epochs"]
        scheduler = snapshot_lr_scheduler(optimizer, steps, model.num_models)

    # Configure criterion
    criterion = telescopeMSE8x8
    
    # Setup tensorboard
    writer = SummaryWriter(params["experiment_dir"])

    # Training loop
    total_iter_count = 0
    num_iters_per_model = len(train_loader) * params["epochs"] // model.num_models
    min_loss = np.finfo(np.float32).max
    for epoch in range(0, params["epochs"]):
        model.train()
        total_loss = 0.0
        for x in tqdm(train_loader):
            if params["gpu"]:
                x = x.cuda()
            optimizer.zero_grad()
            x_hat = model(x)
            loss = criterion(x, x_hat)
            total_loss = total_loss + loss.detach() * len(x)
            loss.backward()
            optimizer.step()
            scheduler.step()
            total_iter_count = total_iter_count + 1
        
        total_loss = total_loss / len(train_loader.dataset)
        total_loss = total_loss.detach().cpu().numpy()
        writer.add_scalar("train_loss", total_loss, epoch)
        val_loss, _ = test(model, val_loader, gpu=params["gpu"])
        writer.add_scalar("val_loss", val_loss, epoch)

        if total_iter_count % num_iters_per_model == 0:
            # Save snapshot
            snapshot = EncoderNeqModel(model_config)
            if params["gpu"]:
                snapshot.cuda()
            snapshot.load_state_dict(model.encoder.state_dict())
            model.encoder_ensemble.append(snapshot)
            print(f"Saved snapshot model # {len(model.encoder_ensemble)}")
            # Evaluate single model on validation data after all snapshots taken
            if len(model.encoder_ensemble) == model.num_models:
                model_val_loss, emd = test(
                    model, test_loader, val_sum, params["gpu"], compute_emd=True,
                )
                # Log ensemble performance
                os.makedirs(params["experiment_dir"], exist_ok=True)
                ensemble_perf_log = os.path.join(
                    params["experiment_dir"], 
                    f"ensemble_perf.txt"
                )
                with open(ensemble_perf_log, "a") as f:
                    f.write(f"Single model val loss: {model_val_loss}\t")
                    f.write(f"Avg EMD: {emd}\n")
            # Evaluate ensemble on validation data and save ensemble checkpoint
            model.single_model_mode = False 
            ensemble_val_loss, _ = test(
                model, test_loader, val_sum, params["gpu"], compute_emd=False,
            )
            # Log ensemble performance
            os.makedirs(params["experiment_dir"], exist_ok=True)
            ensemble_perf_log = os.path.join(
                params["experiment_dir"], 
                f"ensemble_perf.txt"
            )
            with open(ensemble_perf_log, "a") as f:
                f.write(f"Ensemble size {len(model.encoder_ensemble)} val loss: {ensemble_val_loss}\n")
            ensemble_ckpt = {
                "model_dict": model.state_dict(),
                "optim_dict": optimizer.state_dict(),
                "val_loss": val_loss,
                "epoch": epoch,
            }
            torch.save(
                ensemble_ckpt, 
                os.path.join(params["experiment_dir"], "last_ensemble_ckpt.pth")
            )
            model.single_model_mode = True

        checkpoint = {
            "model_dict": model.state_dict(),
            "optim_dict": optimizer.state_dict(),
            "val_loss": val_loss,
            "epoch": epoch,
        }
        if val_loss < min_loss:
            min_loss = val_loss
            for f in os.listdir(params["experiment_dir"]):
                if "checkpoint" in f:
                    os.remove(os.path.join(params["experiment_dir"], f))
            torch.save(
                checkpoint, 
                os.path.join(
                    params["experiment_dir"], 
                    f"checkpoint_epoch{epoch}_loss={val_loss:.3f}.pth"
                )
            )
            torch.save(
                checkpoint, 
                os.path.join(params["experiment_dir"], "best_loss.pth")
            )
        print(f"Epoch: {epoch + 1} / {params['epochs']}\tTrain Loss: {total_loss}\tVal Loss: {val_loss}")
    if params["finetune_epochs"] > 0:
        finetune_decoder(model, dataset, params, writer)
    training_time = datetime.timedelta(seconds=(time.time() - start_time))
    print(f"Total training time: {str(training_time)}")


def train_bagging(
    model, 
    model_config, 
    dataset, 
    params, 
    ensemble_sizes=[2, 4, 8, 16, 32]
):
    """
    Train an ensemble of models using bagging (bootstrap aggregating), where 
    each member model has its own training dataset generated from the original
    training set by sampling with replacement.
    """
    # Need val_sum to compute EMD
    _, val_sum = dataset["test"].get_val_max_and_sum()
    test_loader = torch.utils.data.DataLoader(
        dataset["test"],
        num_workers=params["num_workers"], 
        batch_size=params["batch_size"],  
        pin_memory=True,
        shuffle=False, 
    )
    # Draw training samples based on equal weights
    num_train_samples = len(dataset["train"])
    # Configure optimizer
    optimizer = configure_optimizer(model, params)
    for i in range(model.num_models):
        model.single_model_mode = True
        if params["independent"] and i > 0: 
            # Start w/fresh encoder & decoder each time
            print("Independent training mode")
            model.encoder = EncoderNeqModel(model_config)
            if not params["fixed_decoder"]:
                model.decoder = Decoder()
            if params["gpu"]:
                model.cuda()
            optimizer = configure_optimizer(model, params)
        # Create bagging sampler
        subset_indices = np.random.choice(
            num_train_samples, size=num_train_samples
        )
        sampler = torch.utils.data.sampler.SubsetRandomSampler(subset_indices)
        # Train model
        train(model, dataset, params, sampler=sampler, optimizer=optimizer)
        # Evaluate best single model on validation data 
        best_checkpoint = torch.load(
            os.path.join(params["experiment_dir"], "best_loss.pth")
        )
        model.load_state_dict(best_checkpoint["model_dict"])
        print("Evaluate best single model performance")
        model_val_loss, single_model_emd = test(
            model, 
            test_loader, 
            val_sum=val_sum, 
            gpu=params["gpu"], 
            compute_emd=(i == 0), # Only compute EMD for single model
        )
        # Log single model performance
        os.makedirs(params["experiment_dir"], exist_ok=True)
        ensemble_perf_log = os.path.join(
            params["experiment_dir"], 
            f"ensemble_perf.txt"
        )
        with open(ensemble_perf_log, "a") as f:
            f.write(f"Single model {i + 1} val loss: {model_val_loss}\tAvg EMD = {single_model_emd}\n")
        # Save model to ensemble
        snapshot = EncoderNeqModel(model_config)
        if params["gpu"]:
            snapshot.cuda()
        snapshot.load_state_dict(model.encoder.state_dict())
        model.encoder_ensemble.append(snapshot)
        # Evaluate ensemble on validation data and save ensemble checkpoint
        ensemble_val_loss, _ = evaluate_ensemble(model, dataset, params)
        ensemble_ckpt = {
            "model_dict": model.state_dict(),
            "optim_dict": optimizer.state_dict(),
            "val_loss": ensemble_val_loss,
        }
        torch.save(
            ensemble_ckpt, 
            os.path.join(params["experiment_dir"], "last_ensemble_ckpt.pth")
        )
        print(f"Saved Bagging model # {len(model.encoder_ensemble)}")
        if len(model.encoder_ensemble) in ensemble_sizes:
            finetune_seq_decoder(model, dataset, params)
            evaluate_ensemble(
                model, 
                dataset, 
                params, 
                val_sum=val_sum, 
                compute_emd=True,
            )
            if len(model.encoder_ensemble) < model.num_models:
                # Reset decoder to state prior to finetuning
                best_checkpoint = torch.load(os.path.join(
                    params['experiment_dir'], "last_ensemble_ckpt.pth"
                ))
                model.load_state_dict(best_checkpoint["model_dict"])


def train_fge(model, model_config, dataset, params):
    start_time = time.time()
    # Create data loaders for training and inference
    train_loader = torch.utils.data.DataLoader(
        dataset["train"], 
        num_workers=params["num_workers"], 
        batch_size=params["batch_size"], 
        pin_memory=True,
        shuffle=True, 
    )
    val_loader = torch.utils.data.DataLoader(
        dataset["valid"], 
        num_workers=params["num_workers"], 
        batch_size=params["batch_size"], 
        pin_memory=True,
        shuffle=False, 
    )
    # Need val_sum to compute EMD
    _, val_sum = dataset["test"].get_val_max_and_sum()
    test_loader = torch.utils.data.DataLoader(
        dataset["test"],
        num_workers=params["num_workers"], 
        batch_size=params["batch_size"],  
        pin_memory=True,
        shuffle=False, 
    )

    # Configure optimizer
    optimizer = configure_optimizer(model, params)
    # Configure scheduler
    steps = len(train_loader)
    scheduler = torch.optim.lr_scheduler.CosineAnnealingWarmRestarts(
        optimizer, T_0=steps*params["warm_restart_freq"], T_mult=1,
    )

    # Configure criterion
    criterion = telescopeMSE8x8
    
    # Setup tensorboard
    writer = SummaryWriter(params["experiment_dir"])

    # Training loop
    min_loss = np.finfo(np.float32).max
    for epoch in range(0, params["epochs"]):
        model.train()
        total_loss = 0.0
        for x in tqdm(train_loader):
            if params["gpu"]:
                x = x.cuda()
            optimizer.zero_grad()
            x_hat = model(x)
            loss = criterion(x, x_hat)
            total_loss = total_loss + loss.detach() * len(x)
            loss.backward()
            optimizer.step()
            scheduler.step()
        total_loss = total_loss / len(train_loader.dataset)
        total_loss = total_loss.detach().cpu().numpy()
        writer.add_scalar("train_loss", total_loss, epoch)
        val_loss, _ = test(model, val_loader, gpu=params["gpu"])
        writer.add_scalar("val_loss", val_loss, epoch)
        checkpoint = {
            "model_dict": model.state_dict(),
            "optim_dict": optimizer.state_dict(),
            "val_loss": val_loss,
            "epoch": epoch,
        }
        if val_loss < min_loss:
            min_loss = val_loss
            for f in os.listdir(params["experiment_dir"]):
                if "checkpoint" in f:
                    os.remove(os.path.join(params["experiment_dir"], f))
            torch.save(
                checkpoint, 
                os.path.join(
                    params["experiment_dir"], 
                    f"checkpoint_epoch{epoch}_loss={val_loss:.3f}.pth"
                )
            )
            torch.save(
                checkpoint, 
                os.path.join(params["experiment_dir"], "best_loss.pth")
            )
        print(f"Epoch: {epoch + 1} / {params['epochs']}\tTrain Loss: {total_loss}\tVal Loss: {val_loss}")

    # Evaluate single model on validation data before taking snapshots
    model_val_loss, emd = test(
        model, test_loader, val_sum, params["gpu"], compute_emd=True,
    )
    # Log ensemble performance
    os.makedirs(params["experiment_dir"], exist_ok=True)
    ensemble_perf_log = os.path.join(
        params["experiment_dir"], 
        f"ensemble_perf.txt"
    )
    with open(ensemble_perf_log, "a") as f:
        f.write(f"Pre-FGE single model val loss: {model_val_loss}\t")
        f.write(f"Avg EMD: {emd}\n")

    # Create ensemble
    model.zero_grad()
    # Configure optimizer
    optimizer = configure_optimizer(model, params)

    min_loss = np.finfo(np.float32).max
    num_train_iters = len(train_loader)
    epoch = 0
    while len(model.encoder_ensemble) < model.num_models:
        model.train()
        total_loss = 0.0
        # Num cycles between 2 and 4
        for batch_idx, x in enumerate(tqdm(train_loader)):
            fge_adjust_lr(
                optimizer, 
                epoch, 
                batch_idx, 
                num_train_iters, 
                params["cycle"], 
                params["lr1"], 
                params["lr2"],
            )
            if params["gpu"]:
                x = x.cuda()
            optimizer.zero_grad()
            x_hat = model(x)
            loss = criterion(x, x_hat)
            total_loss = total_loss + loss.detach() * len(x)
            loss.backward()
            optimizer.step()
        if (epoch % params["cycle"] + 1) == params["cycle"] // 2:
            # Create FGE "snapshot"
            snapshot = EncoderNeqModel(model_config)
            if params["gpu"]:
                snapshot.cuda()
            snapshot.load_state_dict(model.encoder.state_dict())
            model.encoder_ensemble.append(snapshot)
            print(f"Saved FGE model # {len(model.encoder_ensemble)}")
            # Evaluate single model on validation data after all snapshots taken
            if len(model.encoder_ensemble) == model.num_models:
                model_val_loss, emd = test(
                    model, test_loader, val_sum, params["gpu"], compute_emd=True,
                )
                # Log ensemble performance
                os.makedirs(params["experiment_dir"], exist_ok=True)
                ensemble_perf_log = os.path.join(
                    params["experiment_dir"], 
                    f"ensemble_perf.txt"
                )
                with open(ensemble_perf_log, "a") as f:
                    f.write(f"Single model val loss: {model_val_loss}\t")
                    f.write(f"Avg EMD: {emd}\n")
            # Evaluate ensemble on validation data and save ensemble checkpoint
            model.single_model_mode = False 
            ensemble_val_loss, _ = test(
                model, test_loader, val_sum, params["gpu"], compute_emd=False,
            )
            # Log ensemble performance
            os.makedirs(params["experiment_dir"], exist_ok=True)
            ensemble_perf_log = os.path.join(
                params["experiment_dir"], 
                f"ensemble_perf.txt"
            )
            with open(ensemble_perf_log, "a") as f:
                f.write(f"Ensemble size {len(model.encoder_ensemble)} val loss: {ensemble_val_loss}\n")
            ensemble_ckpt = {
                "model_dict": model.state_dict(),
                "optim_dict": optimizer.state_dict(),
                "val_loss": ensemble_val_loss,
                "epoch": epoch,
            }
            torch.save(
                ensemble_ckpt, 
                os.path.join(params["experiment_dir"], "last_ensemble_ckpt.pth")
            )
            model.single_model_mode = True
        epoch = epoch + 1
    if params["finetune_epochs"] > 0:
        finetune_decoder(model, dataset, params, writer)
    training_time = datetime.timedelta(seconds=(time.time() - start_time))
    print(f"Total training time: {str(training_time)}")


def fge_adjust_lr(
    optimizer, epoch, batch_idx, num_train_iters, cycle, lr1, lr2
):
    """
    Fast Geometric Ensemble learning rate schedule used to create snapshots
    Ref: https://github.com/TorchEnsemble-Community/Ensemble-Pytorch 
    """
    def scheduler(i):
        t = ((epoch % cycle) + i) / cycle
        if t < 0.5:
            return lr1 * (1.0 - 2.0 * t) + lr2 * 2.0 * t
        else:
            return lr1 * (2.0 * t - 1.0) + lr2 * (2.0 - 2.0 * t)
    if num_train_iters == 0:
        print(f"num train iters = {num_train_iters}")
    lr = scheduler(batch_idx / num_train_iters)
    for param_group in optimizer.param_groups:
        param_group["lr"] = lr

    return lr

def configure_optimizer(model, params):
    weight_decay = params["wd"]
    # Make a list of parameters name fragments which will ignore weight decay
    decay_exclusions = ["bn", "bias", "learned_value"] 
    decay_params = set()
    no_decay_params = set()
    for name, param in model.named_parameters():
        if param.requires_grad:
            no_decay_param_found = False
            for k in decay_exclusions:
                if k in name:
                    no_decay_params.add(param)
                    no_decay_param_found = True
                    print(f"Disabling weight decay for {name}")
            if not no_decay_param_found:
                decay_params.add(param)
                print(f"\tEnabling weight decay for {name}")
    model_params = [
        {
            'params': list(decay_params), 
            'weight_decay': weight_decay
        },
        {
            'params': list(no_decay_params), 
            'weight_decay': 0.0
        }
    ]
    optimizer =  torch.optim.AdamW(
        model_params, 
        lr=params["lr"], 
        weight_decay=weight_decay, 
        betas=(0.5, 0.999), 
    )
    return optimizer

def evaluate_ensemble(model, dataset, params, val_sum=None, compute_emd=False):
    """
    Evaluate ensemble performance on validation dataset
    """
    print("Evaluate ensemble performance")
    model.single_model_mode = False
    test_loader = torch.utils.data.DataLoader(
        dataset["test"],
        num_workers=params["num_workers"], 
        batch_size=params["batch_size"],  
        pin_memory=True,
        shuffle=False, 
    )
    ensemble_val_loss, emd = test(
        model, test_loader, val_sum, params["gpu"], compute_emd=compute_emd,
    )
    # Log ensemble performance
    os.makedirs(params["experiment_dir"], exist_ok=True)
    ensemble_perf_log = os.path.join(
        params["experiment_dir"], 
        f"ensemble_perf.txt"
    )
    with open(ensemble_perf_log, "a") as f:
        f.write(f"Ensemble size {len(model.encoder_ensemble)} val loss: {ensemble_val_loss}\tAvg EMD = {emd}\n")
    model.single_model_mode = True
    return ensemble_val_loss, emd


def finetune_seq_decoder(model, dataset, params, writer=None):
    """
    Finetune decoder of an ensemble whose learners are trained sequentially.
    """
    if not writer:
        writer = SummaryWriter(params["experiment_dir"])
    train_loader = torch.utils.data.DataLoader(
        dataset["train"], 
        num_workers=params["num_workers"], 
        batch_size=params["batch_size"], 
        pin_memory=True,
        shuffle=True, 
    )
    val_loader = torch.utils.data.DataLoader(
        dataset["valid"], 
        num_workers=params["num_workers"], 
        batch_size=params["batch_size"], 
        pin_memory=True,
        shuffle=False, 
    )
    print(f"Finetuning last ensemble saved at: {os.path.join(params['experiment_dir'], 'last_ensemble_ckpt.pth')}")
    best_checkpoint = torch.load(
        os.path.join(params['experiment_dir'], "last_ensemble_ckpt.pth")
    )
    model.load_state_dict(best_checkpoint["model_dict"])

    # Finetine in Ensemble mode
    model.single_model_mode = False
    # Freeze encoder params
    for name, param in model.encoder_ensemble.named_parameters():
        param.requires_grad = False
        print(f"Freeze param {name}")
    # Make sure decoder params are unfrozen
    for name, param in model.decoder.named_parameters():
        param.requires_grad = True
        print(f"Unfreeze param {name}")
    # Configure optimizer
    weight_decay = params["wd"]
    # Make a list of parameters name fragments which will ignore weight decay
    decay_exclusions = ["bn", "bias", "learned_value"] 
    decay_params = set()
    no_decay_params = set()
    for name, param in model.decoder.named_parameters():
        if param.requires_grad:
            no_decay_param_found = False
            for k in decay_exclusions:
                if k in name:
                    no_decay_params.add(param)
                    no_decay_param_found = True
                    print(f"Disabling weight decay for {name}")
            if not no_decay_param_found:
                decay_params.add(param)
                print(f"\tEnabling weight decay for {name}")
    model_params = [
        {
            'params': list(decay_params), 
            'weight_decay': weight_decay
        },
        {
            'params': list(no_decay_params), 
            'weight_decay': 0.0
        }
    ]
    optimizer =  torch.optim.AdamW(
        model_params, 
        lr=params["lr"], 
        weight_decay=weight_decay, 
        betas=(0.5, 0.999), 
    )
    # Configure criterion
    criterion = telescopeMSE8x8
    # Configure scheduler
    steps = len(train_loader)
    if params["finetune_epochs"] > 0:
        scheduler = torch.optim.lr_scheduler.CosineAnnealingWarmRestarts(
            optimizer, T_0=steps*params["finetune_epochs"], T_mult=1,
        )
    min_loss = np.finfo(np.float32).max
    for epoch in range(0, params["finetune_epochs"]):
        model.train()
        total_loss = 0.0
        for x in tqdm(train_loader):
            if params["gpu"]:
                x = x.cuda()
            optimizer.zero_grad()
            x_hat = model(x)
            loss = criterion(x, x_hat)
            total_loss = total_loss + loss.detach() * len(x)
            loss.backward()
            optimizer.step()
            scheduler.step()
        total_loss = total_loss / len(train_loader.dataset)
        total_loss = total_loss.detach().cpu().numpy()
        writer.add_scalar("train_loss", total_loss, epoch)
        val_loss, _ = test(model, val_loader, gpu=params["gpu"])
        writer.add_scalar("val_loss", val_loss, epoch)
        if val_loss < min_loss:
            checkpoint = {
                "model_dict": model.state_dict(),
                "optim_dict": optimizer.state_dict(),
                "val_loss": val_loss,
                "epoch": epoch,
            }
            if type(model) == AdaBoostAutoencoderNeqModel:
                checkpoint["sample_weights"] = model.weights
                checkpoint["model_weights"] = model.model_weights
            min_loss = val_loss
            torch.save(
                checkpoint, 
                os.path.join(
                    params["experiment_dir"], 
                    f"last_ensemble{len(model.encoder_ensemble)}_ckpt.pth"
                )
            )
        print(f"Finetune Epoch: {epoch + 1} / {params['finetune_epochs']}\tTrain Loss: {total_loss}\tVal Loss: {val_loss}")
    model.single_model_mode = True


def set_fixed_decoder(model, fixed_decoder):
    # Load decoder weights
    print("Freezing decoder weights")
    decoder_checkpoint = torch.load(fixed_decoder)
    model.decoder.load_state_dict(decoder_checkpoint["decoder_model_dict"])
    # Freeze decoder weights
    for name, param in model.decoder.named_parameters():
        param.requires_grad = False
        print(f"Freeze param {name}")


def train_adaboost(
    model, 
    model_config, 
    dataset, 
    params, 
    ensemble_sizes=[2, 4, 8, 16, 32]
):
    """
    Based on Adaboost.R2 algorithm from:
    https://dafriedman97.github.io/mlbook/content/c6/s2/boosting.html#regression-with-adaboost-r2
    """
    # Need val_sum to compute EMD
    _, val_sum = dataset["test"].get_val_max_and_sum()
    test_loader = torch.utils.data.DataLoader(
        dataset["test"],
        num_workers=params["num_workers"], 
        batch_size=params["batch_size"],  
        pin_memory=True,
        shuffle=False, 
    )
    if params["fixed_decoder"]:
        set_fixed_decoder(model, params["fixed_decoder"])
    # Configure optimizer
    optimizer = configure_optimizer(model, params)
    for i in range(model.num_models):
        model.single_model_mode = True
        if params["independent"] and i > 0: 
            # Start w/fresh encoder and decoder each time starting with second model
            print("Independent training mode")
            model.encoder = EncoderNeqModel(model_config)
            if not params["fixed_decoder"]:
                model.decoder = Decoder()
            if params["gpu"]:
                model.cuda()
            optimizer = configure_optimizer(model, params)
        elif params["fixed_sparsity_mask"] and i > 0:
            snapshot = EncoderNeqModel(model_config)
            snapshot.load_state_dict(model.encoder.state_dict())
            snapshot.reset_parameters()
            model.encoder = snapshot
            if params["gpu"]:
                model.cuda()
            optimizer = configure_optimizer(model, params)
        # Draw training samples based on sample weights
        # sampler = None # TEMP for testing only
        sampler = torch.utils.data.sampler.WeightedRandomSampler(
            model.weights, model.num_train_samples, replacement=True,
        )
        # Train model
        train(model, dataset, params, sampler=sampler, optimizer=optimizer)
        # Evaluate best single model on validation data 
        best_checkpoint = torch.load(
            os.path.join(params["experiment_dir"], "best_loss.pth")
        )
        model.load_state_dict(best_checkpoint["model_dict"])
        print("Evaluate best single model performance")
        model_val_loss, single_model_emd = test(
            model, 
            test_loader, 
            val_sum=val_sum, 
            gpu=params["gpu"], 
            compute_emd=(i == 0), # Only compute EMD for single model
        )
        # Log single model performance
        os.makedirs(params["experiment_dir"], exist_ok=True)
        ensemble_perf_log = os.path.join(
            params["experiment_dir"], 
            f"ensemble_perf.txt"
        )
        with open(ensemble_perf_log, "a") as f:
            f.write(f"Single model {i + 1} val loss: {model_val_loss}\tAvg EMD = {single_model_emd}\n")
        obs_err = compute_adaboost_sample_error(model, dataset, params)
        # Calculate model error (and possible break if too high). We'd want to
        # break if loss is too high because we are training the model on
        # increasingly more difficult examples and it is possible that (before
        # we generate as many models as we want for the ensemble) the model
        # cannot converge below an error of 0.5 and we want to stop training.
        model_err = torch.sum(model.weights * obs_err)
        if model_err > 0.5:
            model.num_models = len(model.encoder_ensemble)
            print("Exiting Adaboost training early bc model_err > 0.5. model_err = {model_err}")
            break
        beta = model.update_betas(model_err)
        model.update_model_weights()
        if params["gpu"]:
            model.model_weights.cuda()
        model.update_sample_weights(beta, obs_err)
        # Save model to ensemble
        snapshot = EncoderNeqModel(model_config)
        if params["gpu"]:
            snapshot.cuda()
        snapshot.load_state_dict(model.encoder.state_dict())
        model.encoder_ensemble.append(snapshot)
        # Evaluate ensemble on validation data and save ensemble checkpoint
        ensemble_val_loss, _ = evaluate_ensemble(model, dataset, params)
        ensemble_ckpt = {
            "model_dict": model.state_dict(),
            "optim_dict": optimizer.state_dict(),
            "val_loss": ensemble_val_loss,
            "sample_weights": model.weights,
            "model_weights": model.model_weights,
        }
        torch.save(
            ensemble_ckpt, 
            os.path.join(params["experiment_dir"], "last_ensemble_ckpt.pth")
        )
        print(f"Saved Adaboost model # {len(model.encoder_ensemble)}")
        if len(model.encoder_ensemble) in ensemble_sizes:
            finetune_seq_decoder(model, dataset, params)
            evaluate_ensemble(
                model, 
                dataset, 
                params, 
                val_sum=val_sum, 
                compute_emd=True,
            )
            if len(model.encoder_ensemble) < model.num_models:
                # Reset decoder to state prior to finetuning
                best_checkpoint = torch.load(os.path.join(
                    params['experiment_dir'], "last_ensemble_ckpt.pth"
                ))
                model.load_state_dict(best_checkpoint["model_dict"])


def compute_adaboost_sample_error(model, dataset, params):
    """
    Use criterion to compute the observation errors (i.e., model error per
    training example) and return as an array of size training dataset.
    """
    model.eval()
    train_loader = torch.utils.data.DataLoader(
        dataset["train"], 
        num_workers=params["num_workers"], 
        batch_size=params["batch_size"], 
        pin_memory=True,
        shuffle=True, 
    )
    train_losses = torch.zeros(len(dataset["train"]))
    criterion = telescopeMSE8x8
    last_batch_size = params["batch_size"]
    print("Computing AdaBoost sample error")
    for batch_idx, x in enumerate(tqdm(train_loader)):
        batch_size = x.shape[0]
        if params["gpu"]:
            x = x.cuda()
        x_hat = model(x)
        # print(f"x_hat shape = {x_hat.shape}")
        loss = criterion(x, x_hat, reduction=False)
        # print(f"shape of loss = {loss.shape}")
        # print(f"shape of np loss = {loss.detach().cpu().numpy().shape}")
        train_losses[
            batch_idx * last_batch_size : batch_idx * last_batch_size 
            + batch_size
        ] = loss.detach().cpu()
        last_batch_size = batch_size
    # Calculate observation errors
    # expected shape = (Num train examples, )
    train_losses = train_losses / torch.max(train_losses) 
    return train_losses