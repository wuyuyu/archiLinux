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
	if [[ $sizeOutPut -ge $5 ]]; then
		echo "La taille de votre fichier sortie STANDARD: $sizeOutPut K a dépassé $5 K"		
	elif [[ $sizeOutPutError -ge $5 ]]; then
		echo "La taille de votre fichier sortie Error: $sizeOutputError K  a dépassé $5 K"
	else
		echo "Vos fichier n'a pas dépassé 200K"
		echo "Taille du fichier sortie standart: $sizeOutPut K"
		echo "Taille du fichier sortie Error: $sizeOutPutError K"
	fi
	
fi
