#!/bin/bash

echo "****** Lütfen Konteynırların ayağa kalkması için bekleyin..: Yaklaşık ${DELAY} saniye ******"

sleep $DELAY

docker exec mongo1 /scripts/rs-init.sh
