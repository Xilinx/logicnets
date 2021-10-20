# LogicNets for Network Intrusion Detection Systems

This example shows the accuracy that is attainable using the LogicNets methodology on the network intrusion detection task described in our 2020 FPL paper.
This example is a reimplementation of that work.

## Prerequisites

* LogicNets
* numpy
* tensorboard

## Installation

If you're using the docker image, all the above prerequisites will be already installed.
Otherwise, you can install the above dependencies with pip and/or conda.

## Download the Dataset

In order to download the dataset, browse to the directory where this example is contained (e.g., `cd /path/to/logicnets/examples/cybersecurity/`) and run the following:

```bash
mkdir -p data
wget -O data/unsw_nb15_binarized.npz https://zenodo.org/record/4519767/files/unsw_nb15_binarized.npz?download=1
```

## Usage

To train the \"NID-S\", \"NID-M\" and \"NID-L\" networks described in our 2020 FPL paper, run the
following:

```bash
python train.py --arch <nid-s|nid-m|nid-l> --log-dir ./<nid_s|nid_m|nid_l>/
```

To then generate verilog from this trained model, run the following:

```bash
python neq2lut.py --arch <nid-s|nid-m|nid-l> --checkpoint ./<nid_s|nid_m|nid_l>/best_accuracy.pth --log-dir ./<nid_s|nid_m|nid_l>/verilog/ --add-registers
```

## Results

Your results may vary slightly, depending on your system configuration.
The following results are attained when training on a CPU and synthesising with Vivado 2019.2:

| Network Architecture  | Test Accuracy (%) | LUTs  | Flip Flops    | Fmax (Mhz)    | Latency (Cycles)  |
| --------------------- | ----------------- | ----- | ------------- | ------------- | ----------------- |
| NID-S                 |              89.4 |   110 |           103 |       1183.43 |                 3 |
| NID-M                 |              92.6 |  3058 |          1666 |        801.28 |                 5 |
| NID-L                 |              93.1 |  9087 |          4579 |        498.26 |                 5 |

Note, the model architectures reflect the architectures described in our [FPL'20 paper](https://arxiv.org/abs/2004.03021).

## Citation

If you find this work useful for your research, please consider citing
our paper below:

```bibtex
@inproceedings{umuroglu2020logicnets,
  author = {Umuroglu, Yaman and Akhauri, Yash and Fraser, Nicholas J and Blott, Michaela},
  booktitle = {Proceedings of the International Conference on Field-Programmable Logic and Applications},
  title = {LogicNets: Co-Designed Neural Networks and Circuits for Extreme-Throughput Applications},
  year = {2020},
  pages = {291-297},
  publisher = {IEEE Computer Society},
  address = {Los Alamitos, CA, USA},
  month = {sep}
}
```

