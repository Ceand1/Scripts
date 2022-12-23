#!/bin/bash

sudo apt update -y
sudo apt install -y apache2
sudo ufw allow 'Apache'
sudo systemctl start apache2
sudo mkdir /var/www/html
sudo chown -R $USER:$USER /var/www/html
sudo chmod -R 755 /var/www/html

echo "Nome:Antonio Cesar de Andrade Junior" > /var/www/html/index.html
echo "Matricula:473444" >> /var/www/html/index.html
