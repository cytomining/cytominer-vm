#!/bin/bash

# IAM role that allows access to S3 bucket
S3_ROLE="s3-imaging-platform-role"

# Name of S3 bucket to be mounted
BUCKET_ID="imaging-platform"

#-----------------------------
# s3fs
# https://github.com/s3fs-fuse/s3fs-fuse
#-----------------------------
sudo apt-get install -y \
    automake \
    autotools-dev \
    g++ \
    git \
    libcurl4-gnutls-dev \
    libfuse-dev \
    libssl-dev \
    libxml2-dev \
    make \
    pkg-config

mkdir -p ~/work/software/archives

cd ~/work/software/archives

git clone https://github.com/s3fs-fuse/s3fs-fuse.git

cd s3fs-fuse

./autogen.sh

./configure --prefix=/usr --with-openssl

make

sudo make install

cd ~

mkdir ~/bucket

echo "${BUCKET_ID} /home/ubuntu/bucket fuse.s3fs    _netdev,allow_other,iam_role=${S3_ROLE},uid=1000,gid=1000,umask=0022 0 0" | sudo tee --append /etc/fstab

sudo mount -a
