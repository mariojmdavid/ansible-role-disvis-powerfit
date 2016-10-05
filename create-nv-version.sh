#!/bin/bash

# Script to create a new branch corresponding to a new nvidia driver version
# merges from the branch "devel"
# Usage: ./create-nv-version.sh <NVIDIA_VERSION>
# The script is prepared to run after a first time git clone

if [ "x$1" == "x" ]
then
  echo "Usage: ./$0 <NVIDIA_VERSION>"
  echo "Example: ./$0 352_99"
fi

BASE_NV="nvdrv_"
NV_VER="352.93 352_99"

BRANCHES="master devel"

git pull


