#general
echo "-------------------------------------"
echo "----------- GENERAL -----------------"
echo "-------------------------------------"
sudo apt-get -y update
sudo apt-get -y install epel-release
sudo apt-get -y install deltarpm
sudo apt-get -y install bzip2
sudo apt-get -y install lbzip2

echo "-------------------------------------"
echo "----------- PYTHON ------------------"
echo "-------------------------------------"

sudo apt-get -y update
sudo apt-get -y install python3.6-pip
sudo apt-get -y install build-essential libssl-dev libffi-dev python3.6-dev
sudo apt-get -y install python3.6-venv

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

sudo apt-get -y update
sudo apt-get -y install ca-certificates curl gnupg

sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get -y update
sudo apt-get -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

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
