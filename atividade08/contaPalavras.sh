#!/bin/bash

declare -A vet

read -p "Informe o arquivo: " arq
cat $arq >> temp1
sed -i 's/[[:punct:]]/ /' temp1
 

while read line
do
	for i in $line
	do
		let vet[$i]++
	done
done < temp1

for i in ${!vet[@]}
do
	echo "$i:	${vet[$i]}" >> temp2 
done

sort -r -k2 temp2
rm temp2
rm temp1
