FROM python:3.9-slim-buster
#FROM mongo:4.4

# Install MongoDB client
RUN apt-get update && apt-get install -y curl gnupg
RUN curl -fsSL https://www.mongodb.org/static/pgp/server-5.0.asc | apt-key add -
RUN echo "deb http://repo.mongodb.org/apt/debian buster/mongodb-org/5.0 main" | tee /etc/apt/sources.list.d/mongodb-org-5.0.list
RUN apt-get update && apt-get install -y mongodb-org-shell

# Dizin bilgisini gir
WORKDIR /app

# Uygulamanızın gereksinimlerini belirleyen requirements.txt dosyasını kopyala
COPY requirements.txt /app

# Gerekli paketleri yükleyin
RUN pip install --no-cache-dir -r requirements.txt

# Uygulama kodunu kopyalayın
COPY app.py /app

# Flask uygulamanızı çalıştırmak için CMD komutunu kullanın
CMD ["python", "app.py"]
