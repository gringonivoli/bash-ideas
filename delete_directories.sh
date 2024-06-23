#!/bin/bash

# Check if a directory path and directory name to delete are provided as arguments
if [ "$#" -lt 2 ]; then
    echo "Usage: $0 <directory_path> <directory_name_to_delete>"
    exit 1
fi

directory_path="$1"
directory_name_to_delete="$2"

# Display information about the operation
echo "Searching for '$directory_name_to_delete' directories in: $directory_path"
echo "--------------------------------------------------------------"

# Confirmation prompt
echo "Are you sure you want to delete all '$directory_name_to_delete' directories in '$directory_path'? (y/n)"
read -r answer

# Check user's confirmation
case "$answer" in
    [yY]|[yY][eE][sS])
        # Use find command to locate all "$directory_name_to_delete" directories and delete them
        find "$directory_path" -type d -name "$directory_name_to_delete" -exec rm -r {} +
        echo "Deletion process completed."
        ;;
    *)
        echo "Deletion process aborted."
        ;;
esac
