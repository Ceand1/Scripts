#!/bin/bash


b="false"


adicionarHost() {
	 echo $1 $2 >> hosts.db
	}

removerHost() {
	if ls hosts.db &> /dev/null
	then
		if grep $1 hosts.db &> /dev/null
		then
			 sed -i "/$1/d" hosts.db &> /dev/null
		fi
	fi
	}

listarHost() {
	if ls hosts.db &> /dev/null
	then
  		cat  hosts.db
	fi
	}

procurar() {
	grep "$1" hosts.db | cut -d' ' -f2
	}

reversa() {
	grep "$1" hosts.db | cut -d' ' -f1
	}

while getopts "a:i:d:lr:" OPTVAR
do
	b="true"
	case $OPTVAR in
		a)
		hostname=$OPTARG
		;;
		i)
		ips=$OPTARG
		adicionarHost $hostname $ips
		;;
		d)
		hostname=$OPTARG
		removerHost $hostname
		;;
		l)
		listarHost
		;;
		r)
		ips=$OPTARG
		reversa $ips
		;;
	esac
done

if [ "$b" == "false" ]
then
	procurar $1
fi


