#!/bin/bash

apt update
apt upgrade -y
apt install -y apache2 mariadb-client php libapache2-mod-php php-mysql
systemctl start mariadb.service
systemctl enable mariadb.service
systemctl start apache2
systemctl enable apache2
echo -e "[client]\nuser="cesar"\npassword="cesar123 > /home/ubuntu/.my.cnf
wget -c -P /home/ubuntu https://wordpress.org/latest.tar.gz
mkdir /var/www/html/wordpress
cd /home/ubuntu
tar -xzf latest.tar.gz
echo -e "<?php\ndefine( 'DB_NAME', 'scripts' );\ndefine( 'DB_USER', 'cesar' );\ndefine( 'DB_PASSWORD', 'cesar123' );\ndefine( 'DB_HOST', '172.31.45.220' );\ndefine( 'DB_CHARSET', 'utf8' );\ndefine( 'DB_COLLATE', '' );\n$(curl -s https://api.wordpress.org/secret-key/1.1/salt/)\n\$table_prefix= 'wp_';\ndefine( 'WP_DEBUG', false );\nif ( ! defined( 'ABSPATH' ) ) {define( 'ABSPATH', _DIR_ . '/' );}\nrequire_once ABSPATH . 'wp-settings.php';" > /home/ubuntu/wordpress/wp-config.php
cp -r /home/ubuntu/wordpress/* /var/www/html/wordpress/
systemctl restart apache2
