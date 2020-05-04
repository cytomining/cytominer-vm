#!/bin/bash

#-----------------------------
# R
# https://www.digitalocean.com/community/tutorials/how-to-install-r-on-ubuntu-18-04-quickstart
#-----------------------------

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9

sudo add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu bionic-cran35/'

sudo apt-get update -y

sudo apt-get install -y \
    r-base=3.6.3-1bionic

mkdir -p ~/R/library

echo "R_LIBS=~/R/library" > ~/.Renviron

Rscript -e 'install.packages(c("devtools"), repos = "http://cran.us.r-project.org", Ncpus=4)'

Rscript -e 'devtools::install_version("cytominer", version = "0.2.1", repos = "http://cran.us.r-project.org", dependencies=TRUE, Ncpus=4)'

# cytotools doesn't current have tidyr as a dep but will eventually
# (but cytominer_script needs it)
Rscript -e 'install.packages(c("tidyr"), repos = "http://cran.us.r-project.org", Ncpus=4)'

Rscript -e 'devtools::install_github("cytomining/cytotools", ref = "2fc846c", dependencies=TRUE)'

