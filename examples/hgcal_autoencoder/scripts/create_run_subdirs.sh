#!/bin/bash

CONFIG_DIR=./ensemble_configs/adaboost/large

for i in {1..3}; do 
new_dir=${CONFIG_DIR}_configs/config${i}
mkdir -p $new_dir
find -wholename "${CONFIG_DIR}/*.yml" -print | head -n1 | xargs mv -t $new_dir
done

# manually move first 6 files to ./subfolder1
# mv `ls | head -6` ./subfolder1/