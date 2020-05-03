#!/bin/bash

#-----------------------------
# Tools
#-----------------------------

# Do this first
# See https://askubuntu.com/questions/909277/avoiding-user-interaction-with-tzdata-when-installing-certbot-in-a-docker-contai
sudo apt install -y \
    tzdata

sudo apt install -y \
    build-essential \
    bzip2 \
    checkinstall \
    emacs \
    htop \
    jq \
    mysql-client-core-5.7 \
    pandoc \
    parallel \
    postgresql \
    postgresql-client-common \
    sqlite \
    sqlite3 \
    tree \
    zip

sudo apt install -y \
    libbz2-dev \
    libffi-dev \
    libfftw3-dev \
    libldap2-dev \
    libpq-dev \
    libreadline7 \
    libreadline-dev \
    libsasl2-dev \
    libsqlite3-dev \
    libssh2-1-dev \
    libtiff5 \
    libtiff5-dev \
    libxslt1-dev
