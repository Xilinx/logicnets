#  Copyright (C) 2021 Xilinx, Inc
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
from argparse import ArgumentParser
from functools import reduce
import random

import numpy as np

import torch
import torch.nn as nn
import torch.optim as optim
from torch.utils.data import DataLoader
from torch.utils.tensorboard import SummaryWriter

from dataset import get_preqnt_dataset
from models import UnswNb15NeqModel

# TODO: Replace default configs with YAML files.
configs = {
    "nid-s": {
        "hidden_layers": [593, 100],
        "input_bitwidth": 1,
        "hidden_bitwidth": 2,
        "output_bitwidth": 2,
        "input_fanin": 7,
        "hidden_fanin": 7,
        "output_fanin": 7,
        "weight_decay": 0.0,
        "batch_size": 1024,
        "epochs": 100,
        "learning_rate": 1e-1,
        "seed": 25,
        "checkpoint": None,
    },
    "nid-s-comp": {
        "hidden_layers": [49, 7],
        "input_bitwidth": 1,
        "hidden_bitwidth": 2,
        "output_bitwidth": 2,
        "input_fanin": 7,
        "hidden_fanin": 7,
        "output_fanin": 7,
        "weight_decay": 0.0,
        "batch_size": 1024,
        "epochs": 100,
        "learning_rate": 1e-1,
        "seed": 81,
        "checkpoint": None,
    },
    "nid-m": {
        "hidden_layers": [593, 256, 128, 128],
        "input_bitwidth": 1,
        "hidden_bitwidth": 2,
        "output_bitwidth": 2,
        "input_fanin": 7,
        "hidden_fanin": 7,
        "output_fanin": 7,
        "weight_decay": 0.0,
        "batch_size": 1024,
        "epochs": 100,
        "learning_rate": 1e-1,
        "seed": 20,
        "checkpoint": None,
    },
    "nid-m-comp": {
        "hidden_layers": [593, 256, 49, 7],
        "input_bitwidth": 1,
        "hidden_bitwidth": 2,
        "output_bitwidth": 2,
        "input_fanin": 7,
        "hidden_fanin": 7,
        "output_fanin": 7,
        "weight_decay": 0.0,
        "batch_size": 1024,
        "epochs": 100,
        "learning_rate": 1e-1,
        "seed": 40,
        "checkpoint": None,
    },
    "nid-l": {
        "hidden_layers": [593, 100, 100, 100],
        "input_bitwidth": 1,
        "hidden_bitwidth": 3,
        "output_bitwidth": 3,
        "input_fanin": 7,
        "hidden_fanin": 5,
        "output_fanin": 5,
        "weight_decay": 0.0,
        "batch_size": 1024,
        "epochs": 100,
        "learning_rate": 1e-1,
        "seed": 2,
        "checkpoint": None,
    },
    "nid-l-comp": {
        "hidden_layers": [593, 100, 25, 5],
        "input_bitwidth": 1,
        "hidden_bitwidth": 3,
        "output_bitwidth": 3,
        "input_fanin": 7,
        "hidden_fanin": 5,
        "output_fanin": 5,
        "weight_decay": 0.0,
        "batch_size": 1024,
        "epochs": 100,
        "learning_rate": 1e-1,
        "seed": 83,
        "checkpoint": None,
    },
}

# A dictionary, so we can set some defaults if necessary
model_config = {
    "hidden_layers": None,
    "input_bitwidth": None,
    "hidden_bitwidth": None,
    "output_bitwidth": None,
    "input_fanin": None,
    "hidden_fanin": None,
    "output_fanin": None,
}

training_config = {
    "weight_decay": None,
    "batch_size": None,
    "epochs": None,
    "learning_rate": None,
    "seed": None,
}

dataset_config = {
    "dataset_file": None,
}

other_options = {
    "cuda": None,
    "log_dir": None,
    "checkpoint": None,
}

def train(model, datasets, train_cfg, options):
    # Create data loaders for training and inference:
    train_loader = DataLoader(datasets["train"], batch_size=train_cfg['batch_size'], shuffle=True)
    val_loader = DataLoader(datasets["valid"], batch_size=train_cfg['batch_size'], shuffle=False)
    test_loader = DataLoader(datasets["test"], batch_size=train_cfg['batch_size'], shuffle=False)

    # Configure optimizer
    weight_decay = train_cfg["weight_decay"]
    decay_exclusions = ["bn", "bias", "learned_value"] # Make a list of parameters name fragments which will ignore weight decay TODO: make this list part of the train_cfg
    decay_params = []
    no_decay_params = []
    for pname, params in model.named_parameters():
        if params.requires_grad:
            if reduce(lambda a,b: a or b, map(lambda x: x in pname, decay_exclusions)): # check if the current label should be excluded from weight decay
                #print("Disabling weight decay for %s" % (pname))
                no_decay_params.append(params)
            else:
                #print("Enabling weight decay for %s" % (pname))
                decay_params.append(params)
        #else:
            #print("Ignoring %s" % (pname))
    params =    [{'params': decay_params, 'weight_decay': weight_decay},
                {'params': no_decay_params, 'weight_decay': 0.0}]
    optimizer = optim.AdamW(params, lr=train_cfg['learning_rate'], betas=(0.5, 0.999), weight_decay=weight_decay)

    # Configure scheduler
    steps = len(train_loader)
    scheduler = optim.lr_scheduler.CosineAnnealingWarmRestarts(optimizer, T_0=steps*100, T_mult=1)

    # Configure criterion
    criterion = nn.BCEWithLogitsLoss()

    # Push the model to the GPU, if necessary
    if options["cuda"]:
        model.cuda()

    # Setup tensorboard
    writer = SummaryWriter(options["log_dir"])

    # Main training loop
    maxAcc = 0.0
    num_epochs = train_cfg["epochs"]
    for epoch in range(0, num_epochs):
        # Train for this epoch
        model.train()
        accLoss = 0.0
        correct = 0
        for batch_idx, (data, target) in enumerate(train_loader):
            if options["cuda"]:
                data, target = data.cuda(), target.cuda()
            optimizer.zero_grad()
            output = model(data)
            loss = criterion(output, target.unsqueeze(1))
            pred = (torch.sigmoid(output.detach()) > 0.75) * 1
            curCorrect = pred.eq(target.unsqueeze(1)).long().sum()
            curAcc = 100.0*curCorrect / len(data)
            correct += curCorrect
            accLoss += loss.detach()*len(data)
            loss.backward()
            optimizer.step()
            scheduler.step()

            # Log stats to tensorboard
            #writer.add_scalar('train_loss', loss.detach().cpu().numpy(), epoch*steps + batch_idx)
            #writer.add_scalar('train_accuracy', curAcc.detach().cpu().numpy(), epoch*steps + batch_idx)
            #g = optimizer.param_groups[0]
            #writer.add_scalar('LR', g['lr'], epoch*steps + batch_idx)

        accLoss /= len(train_loader.dataset)
        accuracy = 100.0*correct / len(train_loader.dataset)
        print(f"Epoch: {epoch}/{num_epochs}\tTrain Acc (%): {accuracy.detach().cpu().numpy():.2f}\tTrain Loss: {accLoss.detach().cpu().numpy():.3e}")
        #for g in optimizer.param_groups:
        #        print("LR: {:.6f} ".format(g['lr']))
        #        print("LR: {:.6f} ".format(g['weight_decay']))
        writer.add_scalar('avg_train_loss', accLoss.detach().cpu().numpy(), (epoch+1)*steps)
        writer.add_scalar('avg_train_accuracy', accuracy.detach().cpu().numpy(), (epoch+1)*steps)
        val_accuracy = test(model, val_loader, options["cuda"])
        test_accuracy = test(model, test_loader, options["cuda"])
        modelSave = {   'model_dict': model.state_dict(),
                        'optim_dict': optimizer.state_dict(),
                        'val_accuracy': val_accuracy,
                        'test_accuracy': test_accuracy,
                        'epoch': epoch}
        torch.save(modelSave, options["log_dir"] + "/checkpoint.pth")
        if(maxAcc<val_accuracy):
            torch.save(modelSave, options["log_dir"] + "/best_accuracy.pth")
            maxAcc = val_accuracy
        writer.add_scalar('val_accuracy', val_accuracy, (epoch+1)*steps)
        writer.add_scalar('test_accuracy', test_accuracy, (epoch+1)*steps)
        print(f"Epoch: {epoch}/{num_epochs}\tValid Acc (%): {val_accuracy:.2f}\tTest Acc: {test_accuracy:.2f}")

def test(model, dataset_loader, cuda, thresh=0.75):
    model.eval()
    correct = 0
    accLoss = 0.0
    for batch_idx, (data, target) in enumerate(dataset_loader):
        if cuda:
            data, target = data.cuda(), target.cuda()
        output = model(data)
        pred = (torch.sigmoid(output.detach()) > thresh) * 1
        curCorrect = pred.eq(target.unsqueeze(1)).long().sum()
        curAcc = 100.0*curCorrect / len(data)
        correct += curCorrect
    accuracy = 100*float(correct) / len(dataset_loader.dataset)
    return accuracy

if __name__ == "__main__":
    parser = ArgumentParser(description="LogicNets Network Intrusion Detection Example")
    parser.add_argument('--arch', type=str, choices=configs.keys(), default="nid-s",
        help="Specific the neural network model to use (default: %(default)s)")
    parser.add_argument('--weight-decay', type=float, default=None, metavar='D',
        help="Weight decay (default: %(default)s)")
    parser.add_argument('--batch-size', type=int, default=None, metavar='N',
        help="Batch size for training (default: %(default)s)")
    parser.add_argument('--epochs', type=int, default=None, metavar='N',
        help="Number of epochs to train (default: %(default)s)")
    parser.add_argument('--learning-rate', type=float, default=None, metavar='LR',
        help="Initial learning rate (default: %(default)s)")
    parser.add_argument('--cuda', action='store_true', default=False,
        help="Train on a GPU (default: %(default)s)")
    parser.add_argument('--seed', type=int, default=None,
        help="Seed to use for RNG (default: %(default)s)")
    parser.add_argument('--input-bitwidth', type=int, default=None,
        help="Bitwidth to use at the input (default: %(default)s)")
    parser.add_argument('--hidden-bitwidth', type=int, default=None,
        help="Bitwidth to use for activations in hidden layers (default: %(default)s)")
    parser.add_argument('--output-bitwidth', type=int, default=None,
        help="Bitwidth to use at the output (default: %(default)s)")
    parser.add_argument('--input-fanin', type=int, default=None,
        help="Fanin to use at the input (default: %(default)s)")
    parser.add_argument('--hidden-fanin', type=int, default=None,
        help="Fanin to use for the hidden layers (default: %(default)s)")
    parser.add_argument('--output-fanin', type=int, default=None,
        help="Fanin to use at the output (default: %(default)s)")
    parser.add_argument('--hidden-layers', nargs='+', type=int, default=None,
        help="A list of hidden layer neuron sizes (default: %(default)s)")
    parser.add_argument('--log-dir', type=str, default='./log',
        help="A location to store the log output of the training run and the output model (default: %(default)s)")
    parser.add_argument('--dataset-file', type=str, default='data/unsw_nb15_binarized.npz',
        help="The file to use as the dataset input (default: %(default)s)")
    parser.add_argument('--checkpoint', type=str, default=None,
        help="Retrain the model from a previous checkpoint (default: %(default)s)")
    args = parser.parse_args()
    defaults = configs[args.arch]
    options = vars(args)
    del options['arch']
    config = {}
    for k in options.keys():
        config[k] = options[k] if options[k] is not None else defaults[k] # Override defaults, if specified.

    if not os.path.exists(config['log_dir']):
        os.makedirs(config['log_dir'])

    # Split up configuration options to be more understandable
    model_cfg = {}
    for k in model_config.keys():
        model_cfg[k] = config[k]
    train_cfg = {}
    for k in training_config.keys():
        train_cfg[k] = config[k]
    dataset_cfg = {}
    for k in dataset_config.keys():
        dataset_cfg[k] = config[k]
    options_cfg = {}
    for k in other_options.keys():
        options_cfg[k] = config[k]

    # Set random seeds
    random.seed(train_cfg['seed'])
    np.random.seed(train_cfg['seed'])
    torch.manual_seed(train_cfg['seed'])
    os.environ['PYTHONHASHSEED'] = str(train_cfg['seed'])
    if options["cuda"]:
        torch.cuda.manual_seed_all(train_cfg['seed'])
        torch.backends.cudnn.deterministic = True

    # Fetch the datasets
    dataset = {}
    dataset['train'] = get_preqnt_dataset(dataset_cfg['dataset_file'], split="train")
    dataset['valid'] = get_preqnt_dataset(dataset_cfg['dataset_file'], split="test") # This dataset is so small, we'll just use the test set as the validation set, otherwise we may have too few trainings examples to converge.
    dataset['test'] = get_preqnt_dataset(dataset_cfg['dataset_file'], split="test")

    # Instantiate model
    x, y = dataset['train'][0]
    model_cfg['input_length'] = len(x)
    model_cfg['output_length'] = 1
    model = UnswNb15NeqModel(model_cfg)
    if options_cfg['checkpoint'] is not None:
        print(f"Loading pre-trained checkpoint {options_cfg['checkpoint']}")
        checkpoint = torch.load(options_cfg['checkpoint'], map_location='cpu')
        model.load_state_dict(checkpoint['model_dict'])

    train(model, dataset, train_cfg, options_cfg)

