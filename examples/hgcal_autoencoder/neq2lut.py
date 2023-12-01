import os
import time
import yaml
from argparse import ArgumentParser

import torch
from torch.utils.data import DataLoader

from logicnets.nn import    generate_truth_tables, \
                            lut_inference, \
                            module_list_to_verilog_module

from train import test
from dataset import HGCalAutoencoderDataset
from telescope_pt import move_constants_to_gpu
from autoencoder import AutoencoderNeqModel, AutoencoderLutModel
from logicnets.synthesis import synthesize_and_get_resource_counts
from logicnets.util import proc_postsynth_file



def main(args):
    start_time = time.time()
    # Create experiment directory
    experiment_dir = os.path.join(args.save_dir, args.experiment_name)
    os.makedirs(experiment_dir, exist_ok=True)

    # Fetch datasets
    dataset = {} 
    dataset["test"] = HGCalAutoencoderDataset(
        args.data_file, 
        data_dir=args.data_dir, 
        split="test",
    )

    # Load hyperparameters config file
    with open(args.hparams_config, "r") as f:
        config = yaml.safe_load(f)

    # Build model
    model = AutoencoderNeqModel(config)

    # Push model and constants to GPU if necessary
    if args.gpu:
        model.cuda()
        move_constants_to_gpu()

    # Load model weights
    print(f"Preloading model weights from: {args.checkpoint}")
    checkpoint = torch.load(args.checkpoint, map_location=torch.device("cpu"))
    model.load_state_dict(checkpoint["model_dict"])

    # Test the PyTorch model
    avg_emd = -1
    val_sum = None
    # Need val_sum to compute EMD
    if args.compute_emd:
        _, val_sum = dataset["test"].get_val_max_and_sum()
        model.set_val_sum(val_sum)
    test_loader = torch.utils.data.DataLoader(
        dataset["test"],
        num_workers=args.num_workers,
        batch_size=args.batch_size,
        pin_memory=True,
        shuffle=False,
    )
    print("Running inference on baseline model...")
    model.eval()
    loss, avg_emd = test(
        model, 
        test_loader, 
        val_sum=val_sum, 
        gpu=args.gpu, 
        compute_emd=args.compute_emd
    )
    print(f"Baseline loss: {loss:.3f}")
    print(f"Baseline average EMD: {avg_emd:.3f}")

    # Build LUT model
    lut_model = AutoencoderLutModel(config)
    lut_model.load_state_dict(checkpoint['model_dict'])

    # Generate the truth tables in the LUT module
    print("Converting NEQs to LUTs...")
    generate_truth_tables(lut_model, verbose=True)

    # Test the LUT-based model
    print("Running inference on LUT-based model...")
    if args.gpu:
        lut_model.cuda()
    lut_inference(lut_model)
    lut_model.eval()
    lut_loss, lut_avg_emd = test(
        lut_model, 
        test_loader, 
        val_sum=val_sum, 
        gpu=args.gpu, 
        compute_emd=args.compute_emd
    )
    print(f"LUT model loss: {lut_loss:.3f}")
    print(f"LUT model average EMD: {lut_avg_emd:.3f}")

    print(f"Total execution time = {time.time() - start_time}")

    checkpoint = {
        "model_dict": model.state_dict(),
        "val_loss": lut_loss,
        "avg_emd": lut_avg_emd,
    }
    torch.save(
        checkpoint, 
        os.path.join(
            experiment_dir, f"lut_model_loss={lut_loss:.3f}_emd={avg_emd}.pth"
    ))

    # Generate verilog
    verilog_dir = os.path.join(experiment_dir, "verilog")
    os.makedirs(verilog_dir, exist_ok=True)
    print(f"Generating verilog in {verilog_dir}")
    module_list_to_verilog_module(
        lut_model.encoder.module_list, 
        "logicnet", 
        verilog_dir, 
        generate_bench=False, 
        add_registers=args.add_registers,
    )
    print(f"Top level entity stored at: {verilog_dir}/logicnet.v")

    if args.simulate_pre_synthesis_verilog:
        print("Running inference simulation of Verilog-based model...")
        lut_model.verilog_inference(
            verilog_dir, 
            "logicnet.v", 
            add_registers=args.add_registers,
        )
        verilog_loss, verilog_avg_emd = test(
            lut_model, 
            test_loader, 
            val_sum=val_sum,
            gpu=args.gpu, 
            compute_emd=args.compute_emd,
        )
        print(f"Verilog model loss: {verilog_loss:.3f}")
        print(f"Verilog model average EMD: {verilog_avg_emd:.3f}")

    print("Running out-of-context synthesis")
    _ = synthesize_and_get_resource_counts(
        verilog_dir, 
        "logicnet", 
        fpga_part="xcu280-fsvh2892-2L-e", 
        clk_period_ns=args.clock_period, 
        post_synthesis=1,
    )

    if args.simulate_post_synthesis_verilog:
        print("Running post-synthesis inference simulation of Verilog-based model...")
        proc_postsynth_file(verilog_dir)
        lut_model.verilog_inference(
            os.path.join(verilog_dir, "post_synth"), 
            "logicnet_post_synth.v", 
            add_registers=args.add_registers,
        )
        post_synth_loss, post_synth_avg_emd = test(
            lut_model, 
            test_loader,
            val_sum=val_sum, 
            gpu=args.gpu, 
            compute_emd=args.compute_emd,
        )
        print(f"Post-synthesis Verilog model loss: {post_synth_loss:.3f}")
        print(f"Post-synthesis Verilog model average EMD: {post_synth_avg_emd:.3f}")


if __name__ == "__main__":
    parser = ArgumentParser()
    # Dataset args
    parser.add_argument("--data_dir", type=str, default=None)
    parser.add_argument("--data_file", type=str, default="data.npy")
    parser.add_argument("--save_dir", type=str, default="./pt_autoencoder_test")
    parser.add_argument("--experiment_name", type=str, default="autoencoder")
    parser.add_argument("--num_workers", type=int, default=8)
    parser.add_argument("--batch_size", type=int, default=512)
    parser.add_argument("--gpu", action="store_true", default=False)
    parser.add_argument("--compute_emd", action="store_true", default=False)
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
    parser.add_argument(
        "--act1_bitwidth",
        type=int,
        default=4,
        help="bitwidth for the first layer's activation in the encoder"
    )
    parser.add_argument(
        "--act2_bitwidth",
        type=int,
        default=4,
        help="bitwidth for the second layer's activation in the encoder"
    )
    parser.add_argument(
        "--qinput_bitwidth",
        type=int,
        default=6,
        help="bitwidth for quantized input in the encoder"
    )
    parser.add_argument(
        "--input_fanin",
        type=int,
        default=4,
        help="input layer fanin",
    )
    parser.add_argument(
        "--output_fanin",
        type=int,
        default=4,
        help="output layer fanin",
    )
    parser.add_argument(
        "--num_dense_feat",
        type=int,
        default=128,
        help="Number of output features for first dense layer when using dense only model"
    )
    parser.add_argument(
        "--clock_period", 
        type=float, 
        default=1.0,
        help="Target clock frequency to use during Vivado synthesis"
    )
    parser.add_argument(
        '--add_registers', 
        action='store_true', 
        default=False,
        help="Add registers between each layer in generated verilog"
    )
    parser.add_argument(
        "--simulate_pre_synthesis_verilog", 
        action='store_true', 
        default=False,
        help="Simulate the verilog generated by LogicNets"
    )
    parser.add_argument(
        "--simulate_post_synthesis_verilog", 
        action='store_true', 
        default=False,
        help="Simulate the post-synthesis verilog produced by vivado"
    )

    args = parser.parse_args()
    main(args)