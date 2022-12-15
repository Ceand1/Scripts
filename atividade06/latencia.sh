#!/bin/bash

arq=${1}

for ip in $(cat ${arq})
do
	echo "${ip} $(ping -c 10 $ip | grep "rtt" | cut -d"/" -f5)ms" >> temp
done

sort -n -k2 temp
rm temp

