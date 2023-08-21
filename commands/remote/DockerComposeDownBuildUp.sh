cd ~/deployment
sudo service docker start

echo "-----------------------------------------------"
echo "------ DOCKER SHUTDOWN ------------------------"
echo "-----------------------------------------------"
sudo docker-compose down

echo "-----------------------------------------------"
echo "------ DOCKER COMPOSE BUILD UP ----------------"
echo "-----------------------------------------------"
sudo docker-compose build
sudo docker-compose up -d