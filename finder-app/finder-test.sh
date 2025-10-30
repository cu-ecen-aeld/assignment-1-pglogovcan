#!/bin/bash
numfiles=$1
writestr=$2
DIR_NAME="/tmp/aeld-data"
config_path="conf/username.txt"
if [ -z "$1" ]; then
	numfiles=10
fi
if [ -z "$2" ]; then
	writestr="AELD_IS_FUN"
fi
if [ -d "$DIR_NAME" ]; then
	echo "Error: Directory ${DIR_NAME} already exists."
fi
if mkdir -p "$DIR_NAME"; then
	echo "Directory ${DIR_NAME} created successfully."
else
	echo "Error: Failed to create directory ${DIR_NAME}."
	exit 1
fi
username=$(<"$config_path")

for ((i=1; i<=numfiles; i++)); do
	filename="${username}_${i}.txt"
    ./writer.sh "/tmp/aeld-data/${filename}" "$writestr"
done
	
output=$(./finder.sh /tmp/aeld-data $writestr)
expected="The number of files are ${numfiles} and the number of matching lines are ${numfiles}"
if [ "$output" = "$expected" ]; then
	echo "Success"
	exit 0
else 
	echo "Error"
	exit 1
fi
