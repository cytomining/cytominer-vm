sudo apt-get update
sudo apt-get upgrade -y

sudo apt-get install -y emacs htop pandoc parallel postgresql-client-common python-pip sqlite tree zip 
sudo pip install awscli

#-----------------------------
# s3fs
# https://github.com/s3fs-fuse/s3fs-fuse
#-----------------------------
sudo apt-get install -y automake autotools-dev g++ git libcurl4-gnutls-dev libfuse-dev libssl-dev libxml2-dev make pkg-config
mkdir -p ~/work/software/archives
cd ~/work/software/archives
git clone https://github.com/s3fs-fuse/s3fs-fuse.git
cd s3fs-fuse
./autogen.sh
./configure
make
sudo make install
cd ~
mkdir ~/bucket
echo 'imaging-platform /home/ubuntu/bucket fuse.s3fs    _netdev,allow_other,iam_role=s3-imaging-platform-role,uid=1000,gid=1000,umask=0022 0 0' | sudo tee --append /etc/fstab
sudo mount -a 

#-----------------------------
# EFS
# https://console.aws.amazon.com/efs/home?region=us-east-1#/filesystems
#-----------------------------

sudo apt-get install -y nfs-common
sudo mkdir ~/efs
sudo chown ubuntu ~/efs/
sudo mount -t nfs4 -o nfsvers=4.1 $(curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone).fs-3609f37f.efs.us-east-1.amazonaws.com:/ ~/efs


#-----------------------------
# R
# https://www.digitalocean.com/community/tutorials/how-to-set-up-r-on-ubuntu-14-04
#-----------------------------
sudo sh -c 'echo "deb http://cran.rstudio.com/bin/linux/ubuntu trusty/" >> /etc/apt/sources.list'
gpg --keyserver keyserver.ubuntu.com --recv-key E084DAB9
gpg -a --export E084DAB9 | sudo apt-key add -
sudo apt-get update
sudo apt-get -y install r-base
echo "R_LIBS=~/R/library" > ~/.Renviron
Rscript -e 'install.packages(c("devtools", "dplyr", "ggplot2", "knitr", "magrittr", "rmarkdown", "RSQLite", "stringr", "testthat", "tidyr"), Ncpus=4, repos=c("http://cran.us.r-project.org", "https://cran.cnr.berkeley.edu/", "https://cran.revolutionanalytics.com/"), lib="~/R/library/")'


#-----------------------------
# Python
# https://github.com/yyuu/pyenv
#-----------------------------
sudo apt-get install -y python python-dev python-pip postgresql libreadline6 libreadline6-dev sqlite3 libsqlite3-dev bzip2 libbz2-dev libpq-dev mysql-client-core-5.5
mkdir -p ~/work/software/archives
cd ~/work/software/archives
git clone https://github.com/yyuu/pyenv.git ~/.pyenv
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init -)"' >> ~/.bashrc
exec $SHELL
pyenv install 3.5.1
pyenv install 2.7.12
# Do `pip install IPython` within each 

#-----------------------------
# cytominr
#-----------------------------
mkdir -p ~/work/software/cytominr
cd ~/work/software/archives/cytominr
pyenv local 3.5.1
pip install --upgrade pip
pip install git+git://github.com/0x00b1/persistence.git@5e12c8a
Rscript -e 'devtools::install_github("CellProfiler/cytominr")'

#-----------------------------
# docker
# https://docs.docker.com/engine/installation/linux/ubuntulinux/
#-----------------------------
sudo apt-get install -y apt-transport-https ca-certificates
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
sudo sh -c 'echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" >  /etc/apt/sources.list.d/docker.list'
sudo apt-get update
sudo apt-get purge lxc-docker
apt-cache policy docker-engine # Verify that right repository.
sudo apt-get install -y linux-image-extra-$(uname -r)
sudo apt-get install -y docker-engine

sudo groupadd docker
sudo usermod -aG docker ubuntu

#logout
#sleep 60
#sudo service docker start
#docker run hello-world
#docker run shntnu/CellProfiler


