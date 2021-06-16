# LogicNets for Jet-Substructure Classification

This example shows the accuracy that is attainable using the LogicNets methodology on the jet substructure classification task described in our 2020 FPL paper.
This example is a reimplementation of that work.

## Prerequisites

* LogicNets
* h5py
* yaml
* numpy
* pandas
* scikit-learn

## Installation

If you're using the docker image, all the above prerequisites will be already installed.
Otherwise, you can install the above dependencies with pip and/or conda.

## Download the Dataset

In order to download the dataset, browse to the directory where this example is contained (e.g., `cd /path/to/logicnets/examples/jet_substructure/`) and run the following:

```bash
mkdir -p data
wget https://cernbox.cern.ch/index.php/s/jvFd5MoWhGs1l5v/download -O data/processed-pythia82-lhc13-all-pt1-50k-r1_h022_e0175_t220_nonu_truth.z
```

## Usage

To train the \"JSC-S\", \"JSC-M\" and \"JSC-L\" networks described in our 2020 FPL paper, run the
following:

```bash
python train.py --arch <jsc-s|jsc-m|jsc-l> --log-dir ./<jsc_s|jsc_m|jsc_l>/
```

To then generate verilog from this trained model, run the following:

```bash
python neq2lut.py --arch <jsc-s|jsc-m|jsc-l> --checkpoint ./<jsc_s|jsc_m|jsc_l>/best_accuracy.pth --log-dir ./<jsc_s|jsc_m|jsc_l>/verilog/
```

## Results

Your results may vary slightly, depending on your system configuration.
The following results are attained when training on a CPU and synthesising with Vivado 2019.2:

| Network Architecture  | Test Accuracy (%) | LUTs  | Flip Flops    | Fmax (Mhz)    | Latency (Cycles)  |
| --------------------- | ----------------- | ----- | ------------- | ------------- | ----------------- |
| JSC-S                 |              69.4 |   241 |           269 |       1400.56 |                 5 |
| JSC-M                 |              71.9 | 15009 |           848 |        583.77 |                 5 |
| JSC-L                 |              73.0 | 36336 |          2771 |        395.88 |                 6 |

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

