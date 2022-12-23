#!/bin/bash

apt update -y
apt install -y git
apt install -y apache2
ufw allow 'Apache'
systemctl start apache2
mkdir /var/www/html
chown -R $USER:$USER /var/www/html
chmod -R 755 /var/www/html

git clone https://github.com/Ceand1/info

chown -R $USER:$USER /info/info.sh

chmod 777 /info/info.sh
#sudo chmod 777 /etc/systemd/system/
touch /lib/systemd/system/newService.service
chmod 777 /lib/systemd/system/newService.service
echo "[Unit]
After=network.target
[Service]
ExecStart=/info/info.sh
[Install]
WantedBy=default.target"  > /lib/systemd/system/newService.service


systemctl daemon-reload
systemctl start newService.service
systemctl enable newService.service


