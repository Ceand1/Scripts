#!/bin/bash

time=${1}
dir=${2}

while true
do

	ls ${dir} > dirOld.txt
	var1=$(cat dirOld.txt | wc -l)
	
	sleep ${time}
	
	ls ${dir} > dirNew.txt
	var2=$(cat dirNew.txt | wc -l)
	
	if  [ ${var1} -ne ${var2} ]
	then
		temp1=$(diff dirOld.txt dirNew.txt | grep 'txt' | cut -f1 -d' ')
		
		if [ "$temp1" = "<" ]
		then
			temp2=$(diff dirOld.txt dirNew.txt | grep '<' | cut -f2 -d' ' | tr '\n' ' ')
			echo "[$(date +%d-%m-%y" "%H:%M:%S)] Alteracao! ${var1} -> ${var2}. Removidos: $temp2" | tee -a dirSensors.log
		fi
		
		if [ "$temp1" = ">" ]
		then
			temp2=$(diff dirOld.txt dirNew.txt | grep '>' | cut -f2 -d' ' | tr '\n' ' ')
			echo "[$(date +%d-%m-%y" "%H:%M:%S)] Alteracao! ${var1} -> ${var2}. Adicionados: $temp2" | tee -a dirSensors.log
		fi  
		
	fi
	
	rm dirOld.txt
	rm dirNew.txt
	
	
	
done
