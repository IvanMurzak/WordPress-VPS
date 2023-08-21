#general
echo "-------------------------------------"
echo "----------- GENERAL -----------------"
echo "-------------------------------------"
sudo apt-get -y install epel-release
sudo apt-get -y install deltarpm
sudo apt-get -y update
sudo apt-get -y install bzip2
sudo apt-get -y install lbzip2

echo "-------------------------------------"
echo "----------- PYTHON ------------------"
echo "-------------------------------------"
sudo apt-get -y install rh-python36
scl enable rh-python36 bash

echo "-------------------------------------"
echo "----------- NANO --------------------"
echo "-------------------------------------"
sudo apt-get -y install nano
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
sudo apt-get -y install tar

#docker
echo "-------------------------------------"
echo "----------- DOCKER ------------------"
echo "-------------------------------------"

echo "----------- yum-utils ---------------"
sudo apt-get -y install yum-utils
sudo apt-get-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

echo "----------- docker ------------------"
sudo apt-get -y install docker-ce docker-ce-cli containerd.io --disableexcludes=all
sudo systemctl start docker

#docker-compose
echo "-------------------------------------"
echo "----------- DOCKER COMPOSE ----------"
echo "-------------------------------------"
sudo curl -L "https://github.com/docker/compose/releases/download/1.28.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
sudo service docker start

#update
sudo apt-get -y update

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
