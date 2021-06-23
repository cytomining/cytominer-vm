#!/bin/bash

#-----------------------------
# Tools
#-----------------------------

# Do this first
# See https://askubuntu.com/questions/909277/avoiding-user-interaction-with-tzdata-when-installing-certbot-in-a-docker-contai
sudo apt-get install -y \
    tzdata

sudo apt-get install -y \
    build-essential \
    bzip2 \
    checkinstall \
    emacs \
    htop \
    jq \
    pandoc \
    parallel \
    sqlite \
    sqlite3 \
    tree \
    zip

# TODO: These are likely not required
sudo apt-get install -y \
    mysql-client-core-5.7 \
    postgresql \
    postgresql-client-common

sudo apt-get install -y \
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
