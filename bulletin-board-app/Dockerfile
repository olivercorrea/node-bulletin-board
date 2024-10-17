FROM node:current-slim

WORKDIR /usr/src/app

# Instalar netcat
RUN apt-get update && apt-get install -y netcat-openbsd && apt-get clean

COPY package.json package-lock.json* ./
RUN npm install

COPY . .

# Copia el script de espera y dale permisos de ejecución
COPY wait-for-it.sh /usr/src/app/
RUN chmod +x /usr/src/app/wait-for-it.sh

EXPOSE 8080
CMD ["./wait-for-it.sh", "bb-db", "--", "npm", "start"]
