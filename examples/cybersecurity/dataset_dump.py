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

import torch
from torch.utils.data import DataLoader

from logicnets.nn import    generate_truth_tables, \
                            lut_inference, \
                            module_list_to_verilog_module
from logicnets.synthesis import synthesize_and_get_resource_counts

from train import configs, model_config, dataset_config, other_options, test
from dataset import get_preqnt_dataset
from models import UnswNb15NeqModel

def dump_io(model, data_loader, input_file, output_file):
    input_quant = model.module_list[0].input_quant
    _, input_bitwidth = input_quant.get_scale_factor_bits()
    input_bitwidth = int(input_bitwidth)
    total_input_bits = model.module_list[0].in_features*input_bitwidth
    input_quant.bin_output()
    with open(input_file, 'w') as i_f, open(output_file, 'w') as o_f:
        for data, target in data_loader:
            x = input_quant(data)
            indices = target
            for i in range(x.shape[0]):
                x_i = x[i,:]
                xv_i = list(map(lambda z: input_quant.get_bin_str(z), x_i))
                xvc_i = reduce(lambda a,b: a+b, xv_i[::-1])
                i_f.write(f"{int(xvc_i,2):0{int(total_input_bits)}b}\n")
                o_f.write(f"{int(indices[i])}\n")

if __name__ == "__main__":
    parser = ArgumentParser(description="Dump the train and test datasets (after input quantization) into text files")
    parser.add_argument('--arch', type=str, choices=configs.keys(), default="nid-s",
        help="Specific the neural network model to use (default: %(default)s)")
    parser.add_argument('--batch-size', type=int, default=None, metavar='N',
        help="Batch size for evaluation (default: %(default)s)")
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
    parser.add_argument('--dataset-file', type=str, default='data/unsw_nb15_binarized.npz',
        help="The file to use as the dataset input (default: %(default)s)")
    parser.add_argument('--log-dir', type=str, default='./log',
        help="A location to store the output I/O text files (default: %(default)s)")
    parser.add_argument('--checkpoint', type=str, required=True,
        help="The checkpoint file which contains the model weights")
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
    dataset_cfg = {}
    for k in dataset_config.keys():
        dataset_cfg[k] = config[k]
    options_cfg = {}
    for k in other_options.keys():
        if k == 'cuda':
            continue
        options_cfg[k] = config[k]

    # Fetch the datasets
    dataset = {}
    dataset['train'] = get_preqnt_dataset(dataset_cfg['dataset_file'], split="train")
    dataset['test'] = get_preqnt_dataset(dataset_cfg['dataset_file'], split="test")
    train_loader = DataLoader(dataset["train"], batch_size=config['batch_size'], shuffle=False)
    test_loader = DataLoader(dataset["test"], batch_size=config['batch_size'], shuffle=False)

    # Instantiate the PyTorch model
    x, y = dataset["train"][0]
    model_cfg['input_length'] = len(x)
    model_cfg['output_length'] = 1
    model = UnswNb15NeqModel(model_cfg)

    # Load the model weights
    checkpoint = torch.load(options_cfg['checkpoint'], map_location='cpu')
    model.load_state_dict(checkpoint['model_dict'])

    # Test the PyTorch model
    print("Running inference on baseline model...")
    model.eval()
    baseline_accuracy = test(model, test_loader, cuda=False)
    print("Baseline accuracy: %f" % (baseline_accuracy))

    # Run preprocessing on training set.
    train_input_file = config['log_dir'] + "/train_input.txt"
    train_output_file = config['log_dir'] + "/train_output.txt"
    test_input_file = config['log_dir'] + "/test_input.txt"
    test_output_file = config['log_dir'] + "/test_output.txt"
    print(f"Dumping train I/O to {train_input_file} and {train_output_file}")
    dump_io(model, train_loader, train_input_file, train_output_file)
    print(f"Dumping test I/O to {test_input_file} and {test_output_file}")
    dump_io(model, test_loader, test_input_file, test_output_file)
