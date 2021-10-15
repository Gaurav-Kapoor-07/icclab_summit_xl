#!/usr/bin/env bash
set -e

cd ~/rosdocked-irlab/workspace_included
#./build.sh
export IMAGE_NAME=robopaas/rosdocked-noetic-workspace-included:auto

# Get this script's path
pushd `dirname $0` > /dev/null
SCRIPTPATH=`pwd`
popd > /dev/null

# Build the docker image
docker build \
  --build-arg user=$USER\
  --build-arg uid=$UID\
  --build-arg home=/home/ros \
  --build-arg workspace=/home/ros \
  --build-arg shell=$SHELL\
  -t $IMAGE_NAME .

exit 0
