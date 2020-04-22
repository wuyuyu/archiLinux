#!/bin/bash

# mode debug:
#set -x
// mode debug qui t affiche où est l erreur meme quand il y a des pipe:
#set -o pipefail

time=$(echo "$1/1000" | bc)
while true
do	
	echo "OK"
	echo "ERROR"
	sleep $time
done
