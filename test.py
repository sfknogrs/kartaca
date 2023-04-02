from pymongo import MongoClient, ReadPreference

# MongoDB'ye bağlan
client = MongoClient("mongodb://172.23.0.4:27017/")

# Veritabanına eriş
db = client.test
database_names = client.list_database_names()

# Var olan veritabanı isimlerini yazdır
if database_names:
    print("Mevcut veritabanları:")
    for name in database_names:
        print(name)
else:
    print("Veritabanına bağlanılamadı.")
