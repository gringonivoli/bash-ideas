#!/bin/bash

# Check if a directory path is provided as an argument
if [ "$#" -ne 1 ]; then
    directory_path="."
else
  directory_path="$1"
fi


# Check if the provided path exists and is a directory
if [ ! -d "$directory_path" ]; then
    echo "Error: $directory_path is not a directory or does not exist."
    exit 1
fi

# Check if there are any directories in the current directory
if [ "$(ls -d "$directory_path"/*/ 2>/dev/null)" ]; then
    echo "Working on ${directory_path}/ directory..."
    # Loop through each directory
    for dir in "$directory_path"/*/; do
        # Remove trailing slash to get directory name
        dir_name=$(echo "$dir" | sed 's:/$::')
        
        # Tar and gzip the directory
        tar -czf "${dir_name}.tar.gz" "$dir_name"
        
        # Optional: Print a message indicating which directory was tarred
        echo "Tarred => ${dir_name}"
    done
else
    echo "No directories found in the current directory."
fi
exit 0
