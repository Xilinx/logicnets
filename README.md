# LogicNets: Co-Designed Neural Networks and Circuits for Extreme-Throughput Applications

LogicNets is a methodology for designing, training and deploying sparse,
quantized neural networks based on hardware building blocks.
They are able to achieve extremely high throughput and low latency on Xilinx FPGAs.

## Description

This project provides a set of library components and examples to help you design,
train and deploy your own LogicNets networks.
Note, this is considered to be an \'alpha\' release: expect API changes and issues.
You can learn more about LogicNets from [this paper](https://arxiv.org/abs/2004.03021), or from the following YouTube videos:
* [10-minute presentation at DATE'21](https://www.youtube.com/watch?v=xtWySQ-ehRw)
* [20-minute presentation at FPL'20](https://www.youtube.com/watch?v=qCyK5v84jpI)


## Prerequisites

-   [Python\>=3](https://www.python.org/)
-   [PyTorch](https://pytorch.org/)
-   [Brevitas](https://github.com/Xilinx/brevitas)
-   [Verilator](https://www.veripool.org/wiki/verilator)
-   [PyVerilator](https://github.com/csail-csg/pyverilator)
-   [oh-my-xilinx](https://bitbucket.org/maltanar/oh-my-xilinx/)
-   [Vivado Design
    Suite](https://www.xilinx.com/products/design-tools/vivado.html)

## Installation

There are two main ways to install LogicNets:

1.  Using [docker](https://www.docker.com/) (recommended)
2.  Manually (advanced)

### Docker Installation

Follow the steps below to install LogicNets within a `docker` container:

1.  Install [Vivado Design Suite](https://www.xilinx.com/products/design-tools/vivado.html)
1.  Install [docker](https://www.docker.com/).
1.  Clone the LogicNets repository using: `git clone git@github.com:Xilinx/logicnets.git`
1.  Create an environment variable `VIVADO_SETTINGS_FILE` which points to the `settings64.sh` in your Vivado installation (e.g., `export VIVADO_SETTINGS_FILE=/path/to/Vivado/settings64.sh`)
1.  (Optional): Set your `XILINXD_LICENSE_FILE` or `LM_LICENSE_FILE` variables to point to a specific license server
1.  Run `./docker/run-docker.sh` from the root directory of the LogicNets repository
1.  (Optional): Copy your Vivado license file over to the running docker container

You are now ready to run an example, browse to `/workspace/logicnets/examples/jet_substructure/` and start training a LogicNets network!

Note, a license is not required to run any of the provided examples.

### Manual Installation

A manual installation is not recommended for beginners.
We will only provide limited support for people wishing to pursue and manual installation.
People wanting to pursue a manual installation may want to look at the LogicNets Dockerfile,
as this contains details for a full environmental setup (including the installation of dependencies of dependencies).

The basic steps for a manual installation are as follows:

1.  Install [Vivado Design Suite](https://www.xilinx.com/products/design-tools/vivado.html)
1.  Install `oh-my-xilinx` by cloning this [repository](https://bitbucket.org/maltanar/oh-my-xilinx.git) and creating the environment variable `OHMYXILINX` which points to its root directory (e.g., `export OHMYXILINX=/path/to/oh-my-xilinx`)
     * `oh-my-xilinx` requires `zsh`, on Ubuntu, this can be installed as follows: `sudo apt-get install zsh`
1.  Install `Nitro-Parts-lib-Xilinx` by cloning this [repository](https://github.com/dirjud/Nitro-Parts-lib-Xilinx.git) and creating the environment variable `NITROPARTSLIB` which points to its root directory (e.g., `export NITROPARTSLIB=/path/to/Nitro-Parts-lib-Xilinx`)
1.  Install `verilator`, on Ubuntu, this can be done as follows: `sudo apt-get install verilator build-essential`
1.  Install `python3`, `pytorch`, `brevitas` and `pyverilator` using `conda` and/or `pip` or your preferred method
1.  Install `logicnets` using: `pip install --upgrade git+https://github.com/Xilinx/logicnets.git`

Alternatively, instead of the last step you can clone the LogicNets repository and install as follows:

```bash
pip install --upgrade .
```

## Examples

Currently, we have the following examples, located in `./examples/`:
* [Jet substructure classification](examples/jet_substructure/)
* [Network intrusion detection](examples/cybersecurity/)

More examples coming soon.

## Documentation

Documentation site coming soon.

## Citation

If you find this work useful for your research, please consider citing
[our paper](https://arxiv.org/abs/2004.03021) from FPL'20 below:

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
