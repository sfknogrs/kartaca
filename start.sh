#!/bin/bash

DELAY=5

docker-compose --file docker-compose.yml down
docker rm -f $(docker ps -a -q)
docker volume rm $(docker volume ls -q)

echo "****** Lütfen Konteynırların ayağa kalkması için bekleyin..: Yaklaşık ${DELAY} saniye ******"

docker-compose --file docker-compose.yml up 

sleep $DELAY

docker exec mongo1 /scripts/rs-init.sh
