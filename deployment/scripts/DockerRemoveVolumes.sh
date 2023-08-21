sudo docker volume rm $(docker volume ls -q)
sudo docker system prune -a -f