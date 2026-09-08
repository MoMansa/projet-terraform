#!/bin/bash
apt-get update
apt-get install -y nginx
HOSTNAME=$(hostname)
echo "<html><body><h1>Serveur : ${HOSTNAME}</h1></body></html>" > /var/www/html/index.html
systemctl restart nginx
