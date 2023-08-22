#general
echo "-------------------------------------"
echo "----------- GENERAL -----------------"
echo "-------------------------------------"
sudo dnf -y update
sudo dnf -y install epel-release
sudo dnf -y install deltarpm
sudo dnf -y install bzip2
sudo dnf -y install lbzip2

echo "-------------------------------------"
echo "----------- PYTHON ------------------"
echo "-------------------------------------"

sudo dnf -y update
sudo dnf -y groupinstall "Development Tools"
sudo dnf -y install python3-devel openssl-devel zlib-devel bzip2-devel sqlite-devel libffi-devel

# download and extract source archive
wget https://www.python.org/ftp/python/3.6.13/Python-3.6.13.tgz
tar xzf Python-3.6.13.tgz Python-3.6.13/
cd Python-3.6.13/
# configure with all optimizations
CC=clang LLVM_PROFDATA=/usr/bin/llvm-profdata ./configure --enable-optimizations --with-ensurepip=install
# do not touch system default python
CC=clang sudo make altinstall
# cleanup
cd .. && sudo rm -rf Python-3.6.13/

scl enable rh-python36 bash

echo "-------------------------------------"
echo "----------- NANO --------------------"
echo "-------------------------------------"
sudo dnf -y install nano
echo 'echo "set nowrap" >>/etc/nanorc' | sudo sh
echo 'cat <<EOF >>/etc/profile.d/nano.sh
export VISUAL="nano"
export EDITOR="nano"
EOF' | sudo sh
cat <<EOF >>~/.bash_profile
export VISUAL="nano"
export EDITOR="nano"
EOF

#tar archivator
echo "-------------------------------------"
echo "----------- TAR ---------------------"
echo "-------------------------------------"
sudo dnf -y install tar

#docker
echo "-------------------------------------"
echo "----------- DOCKER ------------------"
echo "-------------------------------------"

sudo dnf -y install dnf-plugins-core
sudo dnf -y config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo dnf -y install docker-compose-plugin

sudo systemctl start docker

#docker-compose
echo "-------------------------------------"
echo "----------- DOCKER COMPOSE ----------"
echo "-------------------------------------"

sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo docker-compose --version

sudo service docker start

#update
sudo dnf -y update

#creating directories
echo "-------------------------------------"
echo "----------- CREATE DIRECTORIES ------"
echo "-------------------------------------"
mkdir ~/archives
mkdir ~/persistant
mkdir ~/persistant/CertbotData
mkdir ~/persistant/WordpressData
mkdir ~/persistant/DBData
mkdir ~/deployment
mkdir ~/deployment/nginx-conf

cd ~

echo "-------------------------------------"
echo "----------- DONE!!! -----------------"
echo "-------------------------------------"
