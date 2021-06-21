#!/bin/bash

#-----------------------------
# Python
#-----------------------------

sudo apt-get install -y \
    python3-pip

#-----------------------------
# pyenv
# https://github.com/yyuu/pyenv
#-----------------------------

mkdir -p ~/work/software/archives

cd ~/work/software/archives

git clone https://github.com/pyenv/pyenv.git ~/.pyenv

#from the pyenv readme

echo -e 'export PYENV_ROOT="$HOME/.pyenv"' \
      '\nexport PATH="$PYENV_ROOT/bin:$PATH"' \
      '\neval "$(pyenv init --path)"'  >> ~/.bashrc
echo -e 'export PYENV_ROOT="$HOME/.pyenv"'\
      '\nexport PATH="$PYENV_ROOT/bin:$PATH"'\
      '\neval "$(pyenv init --path)"' | cat - ~/.profile > temp && mv temp ~/.profile

. ~/.profile

# In a non-interactive install, you can't do this:
# exec "$SHELL"
# and so you need to mock this:

export PYENV_ROOT="$HOME/.pyenv"

export PATH="$PYENV_ROOT/bin:$PATH"

eval "$(pyenv init -)"

pyenv install 3.8.10

pyenv shell 3.8.10

pip3 install --upgrade \
    pip \
    setuptools \
    wheel

#-----------------------------
# pe2loaddata
#-----------------------------

cd ~

git clone https://github.com/broadinstitute/pe2loaddata.git

pip3 install --upgrade \
    click \
    PyYAML
    
cd pe2loaddata

pip3 install -e . 


#-----------------------------
# DCP Control Node
# https://github.com/CellProfiler/Distributed-CellProfiler/wiki/Before-you-get-started%3A-setting-up
#-----------------------------

cd ~

git clone https://github.com/CellProfiler/Distributed-CellProfiler.git

pip3 install --upgrade \
    awscli \
    boto3

#-----------------------------
# cytominer-database
#-----------------------------

pip3 install cytominer-database

