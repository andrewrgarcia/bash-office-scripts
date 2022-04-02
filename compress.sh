#!/bin/bash

directory=${1::-1}    #removes forward slash / when autocompleting directory input

#directory=$1

tar -zcvf "$directory".tar.gz "$directory"

if test -f "$directory".tar.gz; then
    echo
    echo ""$directory" compressed to "$directory".tar.gz !"
	echo "Do you want to KEEP the original, uncompressed file? (Y,n)"
	read input
	if [[ $input == "N" || $input == "n" || $input == "no" || $input == "NO" || $input == "No" ]]; then
		rm -r "$directory"
		echo ""$directory" deleted"
	else
		echo ""$directory" preserved"
	fi

fi


