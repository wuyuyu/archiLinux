#!/bin/bash

# mode debug:
#set -x
#set -o pipefail


#ce script prend 3 parametres, $1 un int de milliseconde, $2 un nom de fichier pour logger la sortie stantard, $3 un nom de fichier pour loggela sortie erreur

./genTick $1 | ./genSensorData 2>&1 | {
    while IFS= read -r RAW_LINE; do
	if [[ $RAW_LINE =~ Error ]]; then
		echo "ouiiii j'ai error"
		echo $RAW_LINE >> $3	
	else
		echo $RAW_LINE | cut -d ';' -f 1,2,3,5 >>$2
	fi


	#if grep '^E
      
    done
} 


	
