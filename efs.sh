#!/bin/bash

EFS_ID="fs-3609f37f"

#-----------------------------
# EFS
# https://console.aws.amazon.com/efs/home?region=us-east-1#/filesystems
#-----------------------------

sudo apt-get install -y nfs-common

sudo mkdir ~/efs

sudo chown ubuntu ~/efs/

# instructions from https://docs.aws.amazon.com/efs/latest/ug/wt1-test.html
echo "sudo mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2 $(curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone).${EFS_ID}.efs.us-east-1.amazonaws.com:/ ~/efs" >> ~/.bashrc

# TODO: There's a better way to do it 
# https://docs.aws.amazon.com/efs/latest/ug/accessing-fs-nfs-permissions-per-user-subdirs.html#accessing-fs-nfs-permissions-per-user-subdirs-auto-mount-on-reboot
