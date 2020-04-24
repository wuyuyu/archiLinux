#!/bin/bash

# mode debug:
#set -x
#set -o pipefail


#ce script prend 3 parametres, $1 un int de milliseconde, $2 un nom de fichier pour logger la sortie stantard, $3 un nom de fichier pour loggela sortie erreur, $4 un nom de dossier de log

echo $UID


./genTick $1 | ./genSensorData 2>&1 | {
	mkdir $4
	sudo mv $4 $HOME
	touch $2
	touch $3
	sudo mv *.log $HOME/$4
    while IFS= read -r RAW_LINE; do
		if [[ $RAW_LINE =~ Error ]]; then
			echo "ouiiii j'ai error"
			echo $RAW_LINE >> $HOME/$4/$3 	
		else
			echo $RAW_LINE | cut -d ';' -f 1,2,3,5 >>$HOME/$4/$2
		fi


	#if grep '^E
	
	done
} 





	
