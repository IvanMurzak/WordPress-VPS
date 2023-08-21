cd ~/deployment
sudo docker-compose down

cd ~/
sudo docker rm -f $(docker ps -a -q)