#!/bin/bash

# Check if exactly two arguments are provided
if [ $# -ne 2 ]; then
    echo "Error: Two arguments required - <full file path> <string to write>"
    exit 1
fi

writefile=$1
writestr=$2

# Extract the directory path from the full file path
writedir=$(dirname "$writefile")

# Create the directory path if it does not exist
mkdir -p "$writedir"
if [ $? -ne 0 ]; then
    echo "Error: Failed to create directory $writedir"
    exit 1
fi

# Write the string to the file, overwriting if it exists
echo "$writestr" > "$writefile"
if [ $? -ne 0 ]; then
    echo "Error: Failed to write to file $writefile"
    exit 1
fi

exit 0

