#!/bin/bash

parm1=${1}
parm2=${2}
parm3=${3}
maior=$parm1
const=1

if ! expr ${parm1} + ${const} &> /dev/null
then
    echo "Opa!!! ${parm1} não é número."
elif ! expr ${parm2} + ${const} &> /dev/null
then
    echo "Opa!!! ${parm2} não é número."
elif ! expr ${parm3} + ${const} &> /dev/null
then
    echo "Opa!!! ${parm3} não é número."
fi

if  [ $parm2 -gt $maior ] 
then 
    maior=$parm2 
fi

if  [ $parm3 -gt $maior ] 
then 
    maior=$parm3 
fi

echo "${maior}"




