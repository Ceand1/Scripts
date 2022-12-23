#!/bin/bash

apt update
apt upgrade -y
apt install -y mariadb-server
systemctl start mariadb.service
sed -i "s/127.0.0.1/0.0.0.0/g" /etc/mysql/mariadb.conf.d/50-server.cnf
systemctl restart mariadb.service
systemctl enable mariadb.service
echo -e "mysql<<EOF\nCREATE DATABASE scripts;\nCREATE USER '"cesar"'@'%' IDENTIFIED BY '"cesar123"';\nGRANT ALL PRIVILEGES ON scripts.* TO '"cesar"'@'%';\nUSE scripts;\nEOF\nrm /home/ubuntu/script.sh" > /home/ubuntu/script.sh
chmod +x /home/ubuntu/script.sh
cd /home/ubuntu
./script.sh
