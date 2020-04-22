#!/bin/bash

# mode debug:
#set -x
// mode debug qui t affiche où est l erreur meme quand il y a des pipe:
#set -o pipefail

time=$1

while true
do	
	echo "OK"
	echo "ERROR"
	sleep $time
done
