#!/bin/bash

echo "Criando servidor..."

KEY=${1}

VPC=$(aws ec2 describe-vpcs --query "Vpcs[0].VpcId" --output text)
SUBNET=$(aws ec2 describe-subnets --query "Subnets[0].SubnetId" --output text)

AMI=ami-052efd3df9dad4825
TYPEINSTA=t2.micro

GROUP=$(aws ec2 create-security-group  --group-name groupSecurity01 --description "SecurityGroup1" --vpc-id $VPC --output text)

aws ec2 authorize-security-group-ingress --group-id $GROUP --protocol tcp --port 22 --cidr 0.0.0.0/0
aws ec2 authorize-security-group-ingress --group-id $GROUP --protocol tcp --port 80 --cidr 0.0.0.0/0

IDINSTANCE=$(aws ec2 run-instances --image-id $AMI --instance-type $TYPEINSTA --key-name $KEY --security-group-ids $GROUP --subnet-id $SUBNET --user-data file://pag.sh --query "Instances[0].InstanceId" --output text)

sleep 120

IPSERVER=$(aws ec2 describe-instances --instance-id $IDINSTANCE --query "Reservations[0].Instances[0].PublicIpAddress" --output text)

echo "Acesse: http://$IPSERVER/"

