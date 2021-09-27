#!/bin/bash

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

set -e

DOCKER_GID=$(id -g)
DOCKER_GNAME=$(id -gn)
DOCKER_UNAME=$(id -un)
DOCKER_UID=$(id -u)
DOCKER_TAG=$DOCKER_UNAME/logicnets:$(date +%Y%m%d%H%M)
LOGICNETS_PATH=$(readlink -f $(dirname ${0})/../)
LOGICNETS_MOUNT_POINT=/workspace/logicnets

docker build \
    -t ${DOCKER_TAG} \
    -f docker/Dockerfile.cpu \
    --build-arg GID=$DOCKER_GID \
    --build-arg GNAME=$DOCKER_GNAME \
    --build-arg UNAME=$DOCKER_UNAME \
    --build-arg UID=$DOCKER_UID \
    .

DOCKER_EXEC="docker run --rm --shm-size 32G -i -t --init "

echo "Mounting LogicNets to ${LOGICNETS_MOUNT_POINT} inside the docker container"
DOCKER_EXEC+="-v ${LOGICNETS_PATH}:${LOGICNETS_MOUNT_POINT} "

if [ ! -z "$VIVADO_SETTINGS_FILE" ]; then
    export VIVADO_SETTINGS_FILE=$(readlink -f $VIVADO_SETTINGS_FILE) # Resolve symlinks
    export VIVADO_PATH=$(dirname $VIVADO_SETTINGS_FILE)
    export VIVADO_MOUNT_POINT=$(dirname $VIVADO_PATH)
    echo "\$VIVADO_SETTINGS_FILE defined. Mounting ${VIVADO_MOUNT_POINT} inside the docker container"
    DOCKER_EXEC+="-v ${VIVADO_MOUNT_POINT}:${VIVADO_MOUNT_POINT}:ro "
    DOCKER_EXEC+="-e VIVADO_PATH=$VIVADO_PATH "
else
    echo "\$VIVADO_SETTINGS_FILE not defined. Please set VIVADO_SETTINGS_FILE to point to the location of settings64.sh in your Vivado installation, if you want to synthesize your networks."
fi

if [ ! -z "$XILINXD_LICENSE_FILE" ]; then
    echo "\$XILINXD_LICENSE_FILE environment variable detected. Adding it docker environment."
    DOCKER_EXEC+="-e XILINXD_LICENSE_FILE=${XILINXD_LICENSE_FILE} "
else
    echo "\$XILINXD_LICENSE_FILE not set, Vivado may not have the necessary license within the docker environment."
fi

if [ ! -z "$LM_LICENSE_FILE" ]; then
    echo "\$LM_LICENSE_FILE environment variable detected. Adding it docker environment."
    DOCKER_EXEC+="-e LM_LICENSE_FILE=${LM_LICENSE_FILE} "
else
    echo "\$LM_LICENSE_FILE not set, Vivado may not have the necessary license within the docker environment."
fi

DOCKER_EXEC+="${DOCKER_TAG} /bin/bash"

$DOCKER_EXEC

