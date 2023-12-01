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

#!/bin/sh

# 
# Vivado(TM)
# runme.sh: a Vivado-generated Runs Script for UNIX
# Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
# 

if [ -z "$PATH" ]; then
  PATH=/proj/xbuilds/SWIP/2019.2.2_0131_1950/installs/lin64/Vivado/2019.2/ids_lite/ISE/bin/lin64:/proj/xbuilds/SWIP/2019.2.2_0131_1950/installs/lin64/Vivado/2019.2/bin
else
  PATH=/proj/xbuilds/SWIP/2019.2.2_0131_1950/installs/lin64/Vivado/2019.2/ids_lite/ISE/bin/lin64:/proj/xbuilds/SWIP/2019.2.2_0131_1950/installs/lin64/Vivado/2019.2/bin:$PATH
fi
export PATH

if [ -z "$LD_LIBRARY_PATH" ]; then
  LD_LIBRARY_PATH=
else
  LD_LIBRARY_PATH=:$LD_LIBRARY_PATH
fi
export LD_LIBRARY_PATH

HD_PWD='/workspace/logicnets/examples/hgcal_autoencoder/pipecleaner/hgcal_quant2/results_logicnet/vivadocompile/vivadocompile.runs/synth_1'
cd "$HD_PWD"

HD_LOG=runme.log
/bin/touch $HD_LOG

ISEStep="./ISEWrap.sh"
EAStep()
{
     $ISEStep $HD_LOG "$@" >> $HD_LOG 2>&1
     if [ $? -ne 0 ]
     then
         exit
     fi
}

EAStep vivado -log logicnet.vds -m64 -product Vivado -mode batch -messageDb vivado.pb -notrace -source logicnet.tcl
