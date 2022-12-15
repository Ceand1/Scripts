#!/bin/bash

mkdir cinco

var1=1
var2=1
var3=1

while [ $var1 -le 5 ]
do
	mkdir cinco/dir$var1
	
	while [ $var2 -le 4 ]
	do
		touch cinco/dir$var1/arq$var2.txt
		
		while [ $var3 -le $var2 ]
		do
			echo "$var2" >> cinco/dir$var1/arq$var2.txt
			var3=$(bc <<< ${var3}+1)
		done	
		
		var2=$(bc <<< ${var2}+1)
		var3=1
	done
		
	var1=$(bc <<< ${var1}+1)
	var2=1
done  
