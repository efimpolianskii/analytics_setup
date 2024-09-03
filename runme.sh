#!/bin/bash

#updating packages
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common

#docker installation
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
sudo apt-get install -y docker-ce

#checking if docker was installed
sudo systemctl start docker
sudo systemctl enable docker
sudo docker --version

#creating container with Postgres
sudo docker pull postgres:latest
sudo docker run --name postgres -e POSTGRES_PASSWORD=admin -d -p 5432:5432 postgres

#creating container with Grafana
sudo docker pull grafana/grafana:latest
sudo docker run --name grafana -d -p 3000:3000 grafana/grafana

#creating container with Redash
sudo docker pull redash/redash:latest
sudo docker run --name redash -d -p 5000:5000 redash/redash

#creating container with Jupyter Notebook
sudo docker pull jupyter/base-notebook:latest
sudo docker run --name jupyter -d -p 8888:8888 -e JUPYTER_ENABLE_LAB=yes -v $(pwd)/notebooks:/home/jovyan/work jupyter/base-notebook

#Jupyter Notebook token output
echo "Waiting for Jupyter Notebook..."
sleep 5  #let's get container started

JUPYTER_TOKEN=$(sudo docker logs jupyter 2>&1 | grep -oP '(?<=token=)[a-zA-Z0-9]+')

if [ -n "$JUPYTER_TOKEN" ]; then
    echo "Jupyter Notebook is avaliable: http://localhost:8888/?token=$JUPYTER_TOKEN"
else
    echo "Missing Jupyter Notebook. Please, check the logs: sudo docker logs jupyter"
fi

#Output
echo "Installed containers:"
sudo docker ps

# Вывод адресов доступности сервисов
echo "Toold are avaliable with the following addresses:"
echo "PostgreSQL: localhost:5432"
echo "Grafana: localhost:3000"
echo "Redash: localhost:5000"
echo "Jupyter Notebook: localhost:8888"
