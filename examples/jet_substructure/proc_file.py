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
import subprocess

def proc_postsynth_file(code_dir):
    # The post synthesis file ("logicnet_post") needs some preparation work.
    # Two top level modules are included, "logicnets" and "GLBL". We do not need "GLBL", so we are deleting it.
    post_synth_file = open("%s/results_logicnet/logicnet_post_synth.v"%(code_dir))
    post_synth_list = post_synth_file.readlines()
    post_synth_list_len = len(post_synth_list)
    post_synth_list_index = post_synth_list.index("`ifndef GLBL\n")
    post_synth_list_offset = post_synth_list_len - post_synth_list_index
    post_synth_list = post_synth_list[:-post_synth_list_offset]
    post_synth_file.close()
    post_synth_file = open("%s/results_logicnet/logicnet_post_synth.v"%(code_dir),"w")
    for element in post_synth_list:
        post_synth_file.write(element)
    post_synth_file.close()
    # Create post-synthesis simulation folder called "post_synthesis"
    call_omx = "mkdir %s/post_synth" % (code_dir)
    call_omx = call_omx.split()
    proc = subprocess.Popen(call_omx, stdout=subprocess.PIPE, env=os.environ)
    proc.communicate()
    # Copy post-synthesis Verilog file into the post-synthesis simulation folder
    call_omx = "cp %s/results_logicnet/logicnet_post_synth.v %s/post_synth/." % (code_dir, code_dir)
    call_omx = call_omx.split()
    proc = subprocess.Popen(call_omx, stdout=subprocess.PIPE, env=os.environ)
    proc.communicate()
    # Read "NITROPARTSLIB" environment variable and copy files into simulation folder
    npl_env = os.environ["NITROPARTSLIB"]
    call_omx = "cp -a %s/. %s/post_synth/." % (npl_env, code_dir)
    call_omx = call_omx.split()
    proc = subprocess.Popen(call_omx, stdout=subprocess.PIPE, env=os.environ)
    proc.communicate()