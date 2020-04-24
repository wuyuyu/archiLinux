#!/bin/bash

#set -x
#ce script prend 5 parametres:
# $1 un int de milliseconde
# $2 un nom de fichier pour logger la sortie stantard
# $3 un nom de fichier pour loggela sortie erreur
# $4 un nom de dossier de log
# $5 taille de fichier en octets


pgrep generation.sh
isGeneration=$?

if [ ! -d "$HOME/$4" ]; then
	echo "le dossier de logs de l'utilisateur n'existe pas"
elif [ $isGeneration -ne 0 ]; then
	echo "ou si le script generation.sh  n'est pas lancé"
else
	echo "Ok ça lance et le dossier existe"
	sizeOutPut=$(du $HOME/$4/$2 | cut -d '/' -f 1)
	sizeOutPutError=$(du $HOME/$4/$3 | cut -d '/' -f 1)
	if [[ $sizeOutPut -ge $5 ]]; then
		echo "oui ça a dépassé 200"
	fi

fi
