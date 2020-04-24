#!/bin/bash

# mode debug:
#set -x
#set -o pipefail


# Ce script prend 4 parametres:
# $1 un int de milliseconde
# $2 un nom de fichier pour logger la sortie stantard
# $3 un nom de fichier pour loggela sortie erreur
# $4 un nom de dossier de log


echo "ID de utilisateur courant: $UID"

./genTick $1 | ./genSensorData 2>&1 | {
	echo 'blabla'
	mkdir -p $HOME/$4
	
    while IFS= read -r RAW_LINE; do

		if [[ $RAW_LINE =~ Error ]]; then
			echo "ouiiii j'ai error"
			echo $RAW_LINE >> $HOME/$4/$3 	
		else
			echo $RAW_LINE | cut -d ';' -f 1,2,3,5 >> $HOME/$4/$2
		fi
	
	done
} 



	
