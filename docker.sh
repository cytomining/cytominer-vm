#!/bin/bash

#-----------------------------
# docker
# https://docs.docker.com/engine/install/ubuntu/#prerequisites
#-----------------------------

sudo apt remove -y \
    docker \
    docker-engine \
    docker.io \
    containerd \
    runc

sudo apt update

sudo apt install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt update

sudo apt install -y \
    docker-ce \
    docker-ce-cli \
    containerd.io

sudo groupadd docker

sudo usermod -aG docker ubuntu
