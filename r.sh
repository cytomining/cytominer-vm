#!/bin/bash

#-----------------------------
# R
# https://www.digitalocean.com/community/tutorials/how-to-install-r-on-ubuntu-18-04-quickstart
#-----------------------------

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9

sudo add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu bionic-cran35/'

sudo apt -y update

sudo apt -y install r-base=3.6.3-1bionic

mkdir -p ~/R/library

echo "R_LIBS=~/R/library" > ~/.Renviron

# Here are options for installing specific versions
# - use conda to specify
# - to create a cytominer-vm dummy package on github and then install that

Rscript -e 'install.packages(c("devtools", "docopt", "dplyr", "feather", "ggplot2", "knitr", "magrittr", "readr", "rmarkdown", "RSQLite", "stringr", "testthat", "tidyr", "tidyverse"), Ncpus=4, repos=c("http://cran.us.r-project.org", "https://cran.rstudio.com/", "https://cran.revolutionanalytics.com/"), lib="~/R/library/")'
