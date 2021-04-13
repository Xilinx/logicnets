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

import torch
from torch.utils.data import DataLoader

from logicnets.nn import    generate_truth_tables, \
                            lut_inference, \
                            module_list_to_verilog_module

from train import configs, model_config, dataset_config, other_options, test
from dataset import JetSubstructureDataset
from models import JetSubstructureNeqModel, JetSubstructureLutModel
from logicnets.synthesis import synthesize_and_get_resource_counts

if __name__ == "__main__":
    parser = ArgumentParser(description="Synthesize convert a PyTorch trained model into verilog")
    parser.add_argument('--arch', type=str, choices=configs.keys(), default="jsc-s",
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
    parser.add_argument('--dataset-file', type=str, default='data/processed-pythia82-lhc13-all-pt1-50k-r1_h022_e0175_t220_nonu_truth.z',
        help="The file to use as the dataset input (default: %(default)s)")
    parser.add_argument('--dataset-config', type=str, default='config/yaml_IP_OP_config.yml',
        help="The file to use to configure the input dataset (default: %(default)s)")
    parser.add_argument('--log-dir', type=str, default='./log',
        help="A location to store the log output of the training run and the output model (default: %(default)s)")
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

    # Fetch the test set
    dataset = {}
    dataset['test'] = JetSubstructureDataset(dataset_cfg['dataset_file'], dataset_cfg['dataset_config'], split="test")
    test_loader = DataLoader(dataset["test"], batch_size=config['batch_size'], shuffle=False)

    # Instantiate the PyTorch model
    x, y = dataset['test'][0]
    model_cfg['input_length'] = len(x)
    model_cfg['output_length'] = len(y)
    model = JetSubstructureNeqModel(model_cfg)

    # Load the model weights
    checkpoint = torch.load(options_cfg['checkpoint'], map_location='cpu')
    model.load_state_dict(checkpoint['model_dict'])

    # Test the PyTorch model
    print("Running inference on baseline model...")
    model.eval()
    baseline_accuracy = test(model, test_loader, cuda=False)
    print("Baseline accuracy: %f" % (baseline_accuracy))

    # Instantiate LUT-based model
    lut_model = JetSubstructureLutModel(model_cfg)
    lut_model.load_state_dict(checkpoint['model_dict'])

    # Generate the truth tables in the LUT module
    print("Converting to NEQs to LUTs...")
    generate_truth_tables(lut_model, verbose=True)

    # Test the LUT-based model
    print("Running inference on LUT-based model...")
    lut_inference(lut_model)
    lut_model.eval()
    lut_accuracy = test(lut_model, test_loader, cuda=False)
    print("LUT-Based Model accuracy: %f" % (lut_accuracy))
    modelSave = {   'model_dict': lut_model.state_dict(),
                    'test_accuracy': lut_accuracy}

    torch.save(modelSave, options_cfg["log_dir"] + "/lut_based_model.pth")

    print("Generating verilog in %s..." % (options_cfg["log_dir"]))
    module_list_to_verilog_module(lut_model.module_list, "logicnet", options_cfg["log_dir"])
    print("Top level entity stored at: %s/logicnet.v ..." % (options_cfg["log_dir"]))

    print("Running inference simulation of Verilog-based model...")
    lut_model.verilog_inference(options_cfg["log_dir"], "logicnet.v")
    verilog_accuracy = test(lut_model, test_loader, cuda=False)
    print("Verilog-Based Model accuracy: %f" % (verilog_accuracy))

    print("Running out-of-context synthesis")
    ret = synthesize_and_get_resource_counts(options_cfg["log_dir"], "logicnet", fpga_part="xcu280-fsvh2892-2L-e", clk_period_ns=1.0)
