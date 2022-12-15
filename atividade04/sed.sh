#!/bin/bash

ls | sed -e '/.html$/s/^.*\./\U&/' -e '/.html/s/html/HTM/'

sed -e 's/[[:blank:]]A/INF/' -e 's/[[:blank:]]B/LOG/' -e 's/[[:blank:]]C/RED/' turmas.txt > turmas1.txt 
sed -n '/INF/p' turmas1.txt > turmaINF.txt | sed -n '/LOG/p' turmas1.txt > turmaLOG.txt | sed -n '/RED/p' turmas1.txt > turmaRED.txt

sed -n  '/João/p' turmaINF.txt | cut -c18-30 | tr -s " " + | sed -e 's/^/\(/' -e 's/$/)\/3/' | bc
sed -n  '/Maria/p' turmaINF.txt | cut -c17-30 | tr -s " " + | sed -e 's/^/\(/' -e 's/$/)\/3/' | bc
sed -n  '/Ana/p' turmaINF.txt | cut -c17-30 | tr -s " " + | sed -e 's/^/\(/' -e 's/$/)\/3/' | bc
sed -n  '/Carlos/p' turmaLOG.txt | cut -c17-30 | tr -s " " + | sed -e 's/^/\(/' -e 's/$/)\/3/' | bc | sed -n  '/Carlos/p' turmaLOG.txt >> recuperacao.txt
sed -n  '/Chico/p' turmaLOG.txt | cut -c17-30 | tr -s " " + | sed -e 's/^/\(/' -e 's/$/)\/3/' | bc | sed -n  '/Chico/p' turmaLOG.txt >> recuperacao.txt
sed -n  '/Helena/p' turmaRED.txt | cut -c17-30 | tr -s " " + | sed -e 's/^/\(/' -e 's/$/)\/3/' | bc | sed -n  '/Helena/p' turmaRED.txt >> recuperacao.txt
sed -n  '/Luisa/p' turmaRED.txt | cut -c17-30 | tr -s " " + | sed -e 's/^/\(/' -e 's/$/)\/3/' | bc
sed -n  '/Maite/p' turmaRED.txt | cut -c16-30 | tr -s " " + | sed -e 's/^/\(/' -e 's/$/)\/3/' | bc 
