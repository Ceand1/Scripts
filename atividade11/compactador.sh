#!/bin/bash

TMP='/tmp'



dir=$(dialog --title "Insira o Caminho do Diretorio" --stdout --inputbox "" 0 0)

if [ "$dir" == "" ]
then
	exit 0;
fi

echo 'dialog --stdout --checklist "Selecione o arquivo." 17 50 10 \' > $TMP/viewscr

for name in `ls $dir`
do
	echo "$name ' ' OFF \\" >> $TMP/viewscr
done
echo "2> $TMP/return" >> $TMP/viewscr


filename=$(. $TMP/viewscr)
if [ "$filename" == "" ]
then
	exit 0;
fi


echo "$filename" > temp

cat temp | tr ' ' '\n' | tee temp

for file in $(cat temp)
do	
	cp -r $dir/$file ~/atividades/atividade11/tmp/
	
done


compactacao=$(dialog --stdout --radiolist "Escolha a forma de compactação para: $filename" 0 0 0 \
	"gzip" ' ' OFF \
	"b2zip" ' ' OFF \
)

if [ "$compactacao" == "" ]
then
	exit 0;
fi

nome=$(dialog --title "Nome do arquivo compactado" --stdout --inputbox "" 0 0)

if [ "$nome" == "" ]
then
	exit 0;
fi

if [ "$compactacao" == "gzip" ]
then
	tar -czf $nome.tar.gz tmp/	
	dialog --msgbox "Arquivo $nome.tar.gz criado!!!" 0 0
else
	tar -cvjf $nome.tar.bz2 tmp/
	dialog --msgbox "Arquivo $nome.tar.bz2 criado!!!" 0 0
fi




rm temp
rm -r tmp
rm -f $TMP/return $TMP/viewscr $TMP/tmpmsg


