cd ~/deployment
sudo service docker start

echo "-----------------------------------------------"
echo "------ DOCKER COMPOSE STOP --------------------"
echo "-----------------------------------------------"
sudo docker-compose stop

echo "-----------------------------------------------"
echo "------ DOCKER COMPOSE START -------------------"
echo "-----------------------------------------------"
sudo docker-compose start