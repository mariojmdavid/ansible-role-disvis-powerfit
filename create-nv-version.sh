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

# Change files dependent on nvidia version
# defaults/main.yml:# 352.99 352.93 352.79 352.68 352.63 352.55
# docker-nvidia/ubuntu16.04/Dockerfile:RUN ansible-galaxy install LIP-Computing.ansible-role-nvidia,nvdrv_352.93 && \
# docker-nvidia/ubuntu16.04/README.md:* TAG = nvdrv_352.93 : nvidia driver version 352.93
# docker-nvidia/centos7/Dockerfile:RUN ansible-galaxy install LIP-Computing.ansible-role-nvidia,nvdrv_352.93 && \
# docker-nvidia/centos7/README.md:* TAG = nvdrv_352.93 : nvidia driver version 352.93
# README.md:Playbook example: deployment of driver version 352.93 on a VM
# README.md:        - { role: LIP-Computing.ansible-role-nvidia, nvidia_driver_version: 352.93, kmod_install: true }
# tests/install-docker.yml:    - { role: LIP-Computing.ansible-role-nvidia, nvidia_driver_version: 352.93, kmod_install: false }

