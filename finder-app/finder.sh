#!/bin/bash

# Check number of arguments passed
if [ $# -ne 2 ]; then
    echo "Error: requires two arguments are required: filesdir and searchstr"
    exit 1
fi

filesdir="$1"
searchstr="$2"

# Check if filesdir is a valid directory
if [ ! -d "$filesdir" ]; then
    echo "Error: '$filesdir' is not a directory"
    exit 1
fi

# Count number of files in directory and subdirectories
num_files=$(find "$filesdir" -type f | wc -l)

# Count number of lines containing searchstr in all files
num_lines=$(grep -r "$searchstr" "$filesdir" 2>/dev/null | wc -l)

# Print the result
echo "The number of files are $num_files and the number of matching lines are $num_lines"

exit 0
