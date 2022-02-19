#!/bin/bash

directory=$1

tar -czvf "$directory".tar.gz "$directory"
rm -r "$directory"
