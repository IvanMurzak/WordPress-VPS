#general
echo "-------------------------------------"
echo "----------- GENERAL -----------------"
echo "-------------------------------------"
sudo yum -y install epel-release
sudo yum -y install deltarpm
sudo yum -y update
sudo yum -y install bzip2
sudo yum -y install lbzip2
echo "-------------------------------------"
echo "----------- PYTHON ------------------"
echo "-------------------------------------"
sudo yum install rh-python36
scl enable rh-python36 bash
echo "-------------------------------------"
echo "----------- NANO --------------------"
echo "-------------------------------------"
sudo yum -y install nano
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
sudo yum -y install tar

#docker
echo "-------------------------------------"
echo "----------- DOCKER ------------------"
echo "-------------------------------------"
echo "----------- yum-utils ---------------"

sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

echo "----------- docker ------------------"
sudo yum -y install docker-ce docker-ce-cli containerd.io --disableexcludes=all
sudo systemctl start docker

#docker-compose
echo "-------------------------------------"
echo "----------- DOCKER COMPOSE ----------"
echo "-------------------------------------"
sudo curl -L "https://github.com/docker/compose/releases/download/1.28.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
sudo service docker start

#certbot
echo "-------------------------------------"
echo "----------- CERTBOT -----------------"
echo "-------------------------------------"
sudo yum install python3-certbot-nginx

#creating directories
echo "-------------------------------------"
echo "----------- CREATE DIRECTORIES ------"
echo "-------------------------------------"
mkdir ./archives

mkdir ./persistant
cd ./persistant
mkdir ./CertbotData
mkdir ./WordpressData
mkdir ./DBData
cd ..

mkdir ~/deployment
cd ~/deployment
mkdir ./nginx-conf





echo "-------------------------------------"
echo "----------- DONE!!! -----------------"
echo "-------------------------------------"
