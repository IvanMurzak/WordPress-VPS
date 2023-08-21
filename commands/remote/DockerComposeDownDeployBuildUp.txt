cd ~/deployment

sudo service docker start
sudo docker-compose down

cd ~/
rm -rf deployment

tar xf archives/source.tar.bz2 -C ~/
rm archives/source.tar.bz2

cd ~/deployment

sudo docker-compose build
sudo docker-compose up -d