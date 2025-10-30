#!/bin/bash
filesdir=$1
searchstr=$2
file_count=$(find "$filesdir" -type f | wc -l)
matching_lines=$(find "$filesdir" -type f -exec grep -H "$searchstr" {} \; | wc -l)
if [ $# -lt 2 ]; then
        echo "Error: not enough arguments."
        exit 1
fi
if [ ! -d "$1" ]; then
        echo "Error: First argument doesn't represent a directory."
        exit 1
fi
echo "The number of files are ${file_count} and the number of matching lines are ${matching_lines}"
