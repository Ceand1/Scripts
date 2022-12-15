#!/bin/bash

op=${1}
usuario=${2}
email=${3}

case $op in
	adicionar)
		if ls agenda.db &> /dev/null
		then
 			echo "${usuario}:${email}" >> agenda.db | echo "Usuário ${usuario} adicionado."  
		else
 			echo "Arquivo criado!!!" 
 			echo "${usuario}:${email}" >> agenda.db | echo "Usuário ${usuario} adicionado."
		fi
		;;
	listar)
		if ls agenda.db &> /dev/null
		then
  			cat  agenda.db
		else
 			echo "Arquivo vazio!!!"
		fi
		;;
	remover)
		if ls agenda.db &> /dev/null
		then
			if grep "${usuario}" agenda.db &> /dev/null
			then
				user=$(grep "${usuario}" agenda.db | cut -d ":" -f1) 
				sed -i "/${usuario}/d" agenda.db &> /dev/null | echo "Usuário ${user} foi removido."
			else
 				echo "O ${usuario} não existe."
			fi
		fi
		;;
	*)
		echo "Opção inválida!!!"
		;;
esac	
		
