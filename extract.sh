#!/bin/bash

directory=$1

tar -xzvf "$directory".tar.gz
rm -r "$directory".tar.gz
