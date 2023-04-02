from flask import Flask, jsonify
from pymongo import MongoClient, ReadPreference
import random

app = Flask(__name__)

# MongoDB'ye bağlan
client = MongoClient('mongodb://172.23.0.2:27017,172.23.0.3:27018,172.23.0.4:27019/?replicaSet=dbrs')
db = client["stajdb"]
collection_iller = db["iller"]
collection_ulkeler = db["ulkeler"]


# Flask uygulaması
@app.route("/")
def hello():
    return "Merhaba Python!"


# Random bir il döndüren endpoint
@app.route("/staj")
def staj():
    il = random.choice(list(collection_iller.find()))
    return jsonify({"il": il["isim"]})


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=4444)
