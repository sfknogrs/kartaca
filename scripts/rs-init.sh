#!/bin/bash

DELAY=15

mongo <<EOF
var config = {
    "_id": "dbrs",
    "version": 1,
    "members": [
        {
            "_id": 1,
            "host": "mongo1:27017",
            "priority": 2
        },
        {
            "_id": 2,
            "host": "mongo2:27017",
            "priority": 1
        },
        {
            "_id": 3,
            "host": "mongo3:27017",
            "priority": 1
        }
    ]
};
rs.initiate(config, { force: true });
EOF

echo "****** Lütfen replicaSet ayarları yapılırken bekleyin..: Yaklaşık ${DELAY} saniye *******"

sleep $DELAY

# Create "stajdb" database
mongo --eval "db = (new Mongo('localhost:27017')).getDB('stajdb');"

mongo stajdb --eval "db.createCollection('iller')"

mongo stajdb --eval " db.iller.insertMany([
    { name: 'Istanbul' },
    { name: 'Ankara' },
    { name: 'Izmir' },
    { name: 'Bursa' },
    { name: 'Adana' },
    { name: 'Gaziantep' },
    { name: 'Konya' },
    { name: 'Antalya' },
    { name: 'Diyarbakir' },
    { name: 'Mersin' }
  ]);"


mongo stajdb --eval "db.createCollection('ulkeler');"

mongo stajdb --eval "db.ulkeler.insertMany([
    { name: 'Turkey' },
    { name: 'France' },
    { name: 'Germany' },
    { name: 'Italy' },
    { name: 'Spain' },
    { name: 'United Kingdom' },
    { name: 'Russia' },
    { name: 'United States' },
    { name: 'Ireland' },
    { name: 'Denmark' },
    { name: 'Sweden' }
  ]);"
DELAY=5
echo "****** Lütfen Veritbanı kayıtları oluşturulurken bekleyin..: Yaklaşık ${DELAY} saniye *******"

sleep $DELAY

#mongo < /scripts/init.js
