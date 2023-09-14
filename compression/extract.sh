#!/bin/bash

################################################################################
# Script Description:
#   This Bash script simplifies the process of extracting and decompressing a 
#   tar.gz archive into a specified directory and then deletes the archive.
#
# Usage:
#   ./extract.sh archive_file
#
# Example:
#   To extract and decompress the contents of "my_archive.tar.gz" and then 
#   delete the archive:
#   ./extract.sh my_archive.tar.gz
#
################################################################################

# Specify the path to the tar.gz archive as the argument
directory=$1

# Extract and decompress the contents of the specified archive
tar -xzvf "$directory"

# Remove the archive file after extraction
rm -r "$directory"
