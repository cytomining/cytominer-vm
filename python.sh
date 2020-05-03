#!/bin/bash

#-----------------------------
# Python
# https://github.com/yyuu/pyenv
#-----------------------------
sudo easy_install pip

mkdir -p ~/work/software/archives

cd ~/work/software/archives

git clone https://github.com/yyuu/pyenv.git ~/.pyenv

echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc

echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc

echo 'eval "$(pyenv init -)"' >> ~/.bashrc

export PYENV_ROOT="$HOME/.pyenv"

export PATH="$PYENV_ROOT/bin:$PATH"

eval "$(pyenv init -)"


pyenv install 3.8.2

pyenv install 2.7.12


pyenv shell 3.8.2

pip install --upgrade pip

pip install --upgrade setuptools

pip install IPython pyyaml


# this is for pe2loaddata

pyenv shell 2.7.12

pip install --upgrade pip

pip install --upgrade setuptools

pip install IPython==5.0

pip install pyyaml

# DCP and cytominer are now configured within this script because
# pyenv wouldn't load when they were moved into their own scripts

#-----------------------------
# DCP
#-----------------------------
cd 

git clone https://github.com/CellProfiler/Distributed-CellProfiler.git

cd Distributed-CellProfiler/files

pyenv local 3.8.2

pyenv shell 3.8.2

pip install -r requirements.txt

#optional packages to be able to run ancillary DCP functions
sudo apt-get install -y cloud-image-utils parallel python-pandas

#-----------------------------
# cytominer
#-----------------------------
pyenv shell 3.8.2

pip install --upgrade pip

pip install git+git://github.com/cytomining/cytominer-database.git

pip install IPython

Rscript -e 'devtools::install_github("cytomining/cytominer", dependencies=TRUE)'
