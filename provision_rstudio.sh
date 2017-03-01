#!/bin/bash

#-----------------------------
# R
# https://www.digitalocean.com/community/tutorials/how-to-set-up-r-on-ubuntu-14-04
#-----------------------------
sudo su -c "Rscript -e \"install.packages(c('devtools', 'docopts', 'dplyr', 'feather', 'ggplot2', 'knitr', 'magrittr', 'readr', 'rmarkdown', 'RSQLite', 'stringr', 'testthat', 'tidyr'), Ncpus=4, repos=c('http://cran.us.r-project.org', 'https://cran.cnr.berkeley.edu/', 'https://cran.revolutionanalytics.com/'))\"" rstudio

#-----------------------------
# cytominer
#-----------------------------
sudo su -c "Rscript -e \"devtools::install_github('CellProfiler/cytominer', dependencies=TRUE)\"" rstudio


#-----------------------------
# change permissions so that rstudio can write to ubuntu directory
#-----------------------------
sudo usermod -aG ubuntu rstudio

sudo chmod 775 /home/ubuntu/

sudo chmod 775 /home/ubuntu/efs/

sudo chmod 775 /home/ubuntu/bucket/


