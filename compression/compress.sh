#!/bin/bash

################################################################################
# Script Description:
#   This Bash script simplifies the process of compressing a directory into a 
#   tar.gz archive while providing options to preserve or delete the original 
#   directory. It also handles the case when a forward slash '/' is included 
#   when specifying the directory path.
#
# Usage:
#   ./compress_directory.sh directory_path
#
# Example:
#   To compress the directory "my_directory" and keep the original:
#   ./compress_directory.sh my_directory/
#
#   To compress the directory "my_directory" and delete the original:
#   ./compress_directory.sh my_directory/
#
################################################################################

# directory=${1::-1}    #removes forward slash / when autocompleting directory input
# Remove trailing forward slash '/' from directory input (if present)
directory=${1%/}

# Compress the directory into a tar.gz archive
tar -zcvf "$directory".tar.gz "$directory"

# Check if the compression was successful
if test -f "$directory".tar.gz; then
    echo
    echo ""$directory" compressed to "$directory".tar.gz !"
    echo "Do you want to KEEP the original, uncompressed file? (Y/n)"
    read input
    if [[ $input == "N" || $input == "n" || $input == "no" || $input == "NO" || $input == "No" ]]; then
        rm -r "$directory"
        echo ""$directory" deleted"
    else
        echo ""$directory" preserved"
    fi
fi

