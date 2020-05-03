#!/bin/bash

#-----------------------------
# docker
# https://docs.docker.com/engine/installation/linux/ubuntulinux/
#-----------------------------
sudo apt install -y apt-transport-https ca-certificates

sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

sudo sh -c 'echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" >  /etc/apt/sources.list.d/docker.list'

sudo apt update

sudo apt purge lxc-docker

apt-cache policy docker-engine # Verify that right repository.

sudo apt install -y linux-image-extra-$(uname -r)

sudo apt install -y docker-engine

sudo groupadd docker

sudo usermod -aG docker ubuntu
