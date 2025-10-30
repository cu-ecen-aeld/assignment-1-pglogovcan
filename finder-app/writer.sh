#!/bin/bash

writefile="$1"
writestr="$2"

# Check if both arguments are provided
if [ -z "$writefile" ] || [ -z "$writestr" ]; then
  echo "Usage: $0 <file_path> <content>"
  exit 1
fi

mkdir -p "$(dirname "$writefile")"

echo "$writestr" > "$writefile"
if [ $? -ne 0 ]; then
  echo "Error: Could not create file '$writefile'"
  exit 1
fi
