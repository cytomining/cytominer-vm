#!/bin/bash

EFS_ID="fs-3609f37f"

#-----------------------------
# EFS
# https://console.aws.amazon.com/efs/home?region=us-east-1#/filesystems
#-----------------------------

sudo apt install -y nfs-common

sudo mkdir ~/efs

sudo chown ubuntu ~/efs/

echo "sudo mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2 $(curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone).${EFS_ID}.efs.us-east-1.amazonaws.com:/ ~/efs" >> ~/.bashrc
