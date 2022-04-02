#!/bin/bash

directory=$1

tar -xzvf "$directory"
rm -r "$directory"
