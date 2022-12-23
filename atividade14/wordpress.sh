#!/bin/bash

echo "Criando servidor de Banco de Dados..."

KEY=${1}
USER=${2}
PASSWORD=${3}

IPLOCAL=$(curl --silent ifconfig.me)

VPC=$(aws ec2 describe-vpcs --query "Vpcs[0].VpcId" --output text)
SUBNET=$(aws ec2 describe-subnets --query "Subnets[0].SubnetId" --output text)

AMI=ami-052efd3df9dad4825
TYPEINSTA=t2.micro

GROUP=$(aws ec2 create-security-group  --group-name groupSecurity01 --description "SecurityGroup1" --vpc-id $VPC --output text)

aws ec2 authorize-security-group-ingress --group-id $GROUP --protocol tcp --port 22 --cidr $IPLOCAL/32
aws ec2 authorize-security-group-ingress --group-id $GROUP --protocol tcp --port 80 --cidr 0.0.0.0/0
aws ec2 authorize-security-group-ingress --group-id $GROUP --protocol tcp --port 3306 --source-group $GROUP


cat<<EOF > confServer.sh
#!/bin/bash

apt update
apt upgrade -y
apt install -y mariadb-server

systemctl start mariadb.service

sed -i "s/127.0.0.1/0.0.0.0/g" /etc/mysql/mariadb.conf.d/50-server.cnf

systemctl restart mariadb.service
systemctl enable mariadb.service

echo -e "mysql<<EOF\nCREATE DATABASE scripts;\nCREATE USER '"$USER"'@'%' IDENTIFIED BY '"$PASSWORD"';\nGRANT ALL PRIVILEGES ON scripts.* TO '"$USER"'@'%';\nUSE scripts;\nEOF\nrm /home/ubuntu/script.sh" > /home/ubuntu/script.sh

chmod +x /home/ubuntu/script.sh
cd /home/ubuntu
./script.sh
EOF




IDINSTANCE=$(aws ec2 run-instances --image-id $AMI --instance-type $TYPEINSTA --key-name $KEY --security-group-ids $GROUP --subnet-id $SUBNET --user-data file://confServer.sh --query "Instances[0].InstanceId" --output text)

while true
do
	EXEC=$(aws ec2 describe-instances --instance-id $IDINSTANCE --query "Reservations[0].Instances[].State.Name" --output text)
	if [ "$EXEC" == "running" ]
	then
		IpPrivate=$(aws ec2 describe-instances --instance-id $IDINSTANCE --query "Reservations[0].Instances[].PrivateIpAddress" --output text)
		break
	fi
done

sleep 45

echo "IP Privado do Banco de Dados: $IpPrivate"

echo "Criando servidor de Aplicação..."


cat<<EOF >  confCliente.sh
#!/bin/bash

apt update
apt upgrade -y
apt install -y apache2 mariadb-client php libapache2-mod-php php-mysql

systemctl start mariadb.service
systemctl enable mariadb.service
systemctl start apache2
systemctl enable apache2

echo -e "[client]\nuser="$USER"\npassword="$PASSWORD > /home/ubuntu/.my.cnf
wget -c -P /home/ubuntu https://wordpress.org/latest.tar.gz
mkdir /var/www/html/wordpress
cd /home/ubuntu
tar -xzf latest.tar.gz

echo -e "<?php\ndefine( 'DB_NAME', 'scripts' );\ndefine( 'DB_USER', '$USER' );\ndefine( 'DB_PASSWORD', '$PASSWORD' );\ndefine( 'DB_HOST', '$IpPrivate' );\ndefine( 'DB_CHARSET', 'utf8' );\ndefine( 'DB_COLLATE', '' );\n\$(curl -s https://api.wordpress.org/secret-key/1.1/salt/)\n\\\$table_prefix= 'wp_';\ndefine( 'WP_DEBUG', false );\nif ( ! defined( 'ABSPATH' ) ) {define( 'ABSPATH', _DIR_ . '/' );}\nrequire_once ABSPATH . 'wp-settings.php';" > /home/ubuntu/wordpress/wp-config.php

cp -r /home/ubuntu/wordpress/* /var/www/html/wordpress/
systemctl restart apache2
EOF

IDINSTANCE=$(aws ec2 run-instances --image-id $AMI --instance-type $TYPEINSTA --key-name $KEY --security-group-ids $GROUP --subnet-id $SUBNET --user-data file://confCliente.sh --query "Instances[0].InstanceId" --output text)


while true
do
	EXEC=$(aws ec2 describe-instances --instance-id $IDINSTANCE --query "Reservations[0].Instances[].State.Name" --output text)
	if [ "$EXEC" == "running" ]
	then
		IpPublicServer=$(aws ec2 describe-instances --instance-id $IDINSTANCE --query "Reservations[0].Instances[].PublicIpAddress" --output text)
		break
	fi
done

sleep 210

echo "IP Público do Servidor de Aplicação: $IpPublicServer"
echo "Acesse http://$IpPublicServer/wordpress para finalizar a configuração."
