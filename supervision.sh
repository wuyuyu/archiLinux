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
	echo "Le dossier de logs de l'utilisateur n'existe pas"
elif [ $isGeneration -ne 0 ]; then
	echo "Le script generation.sh  n'est pas lancé"
else
	echo "Ok ça lance et le dossier existe"
	sizeOutPut=$(du $HOME/$4/$2 | cut -d '/' -f 1)
	sizeOutPutError=$(du $HOME/$4/$3 | cut -d '/' -f 1)
	if [[ $sizeOutPut -ge $5 ]] ||  [[ $sizeOutPutError -ge $5 ]]; then
		killall generation.sh
		echo "L'execution du script generation.sh a été stopé."
		echo "La taille de vos fichiers a dépassé $5 K"
		echo $sizeOutPut $sizeOutPutError
		zip log$(date "+%Y-%m-%d").zip $HOME/$4/$2 $HOME/$4/$3
		mv log$(date "+%Y-%m-%d").zip $HOME/$4/

		echo "Les fichiers sont bien zipé dans la répertoire utilisateur courant"
	else
		echo "Vos fichier n'a pas dépassé 200K"
		echo "Taille du fichier sortie standart: $sizeOutPut K"
		echo "Taille du fichier sortie Error: $sizeOutPutError K"
	fi
	
fi
