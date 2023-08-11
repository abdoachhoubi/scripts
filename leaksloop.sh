#!/bin/bash

if [ ! $# -eq 1 ]; then
	echo "Error: No arguments!"
	exit 1
fi

while [ 1 ]
do
	leaks $1 | grep bytes
	sleep 1
done
