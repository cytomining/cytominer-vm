#!/bin/bash

#-----------------------------
# R
# https://www.digitalocean.com/community/tutorials/how-to-set-up-r-on-ubuntu-14-04
#-----------------------------
sudo sh -c 'echo "deb http://cran.rstudio.com/bin/linux/ubuntu trusty/" >> /etc/apt/sources.list'
gpg --keyserver keyserver.ubuntu.com --recv-key E084DAB9
gpg -a --export E084DAB9 | sudo apt-key add -
sudo apt-get update
sudo apt-get -y install r-base
mkdir -p ~/R/library
echo "R_LIBS=~/R/library" > ~/.Renviron
Rscript -e 'install.packages(c("devtools", "docopt", "dplyr", "feather", "ggplot2", "knitr", "magrittr", "readr", "rmarkdown", "RSQLite", "stringr", "testthat", "tidyr", "tidyverse"), Ncpus=4, repos=c("http://cran.us.r-project.org", "https://cran.cnr.berkeley.edu/", "https://cran.revolutionanalytics.com/"), lib="~/R/library/")'
