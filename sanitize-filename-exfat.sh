#!/usr/bin/env bash

# Check if a directory path is provided as an argument
if [ -z "$1" ]; then
  # If no argument is provided, use the current working directory
  dir=$(pwd)
else
  # Use the provided directory path
  dir=$1
fi

filelist=$(find $dir -depth -name '*[<>:"/\\|?*]*')
renamedlist=$(find $dir -depth -name '*[<>:"/\\|?*]*' | tr -d '<>:"/\\|?*')

# Function to ask for user confirmation
confirm() {
    echo "The following files will be renamed:"
    echo "$filelist"
    echo "The files will be renamed to:"
    echo "$renamedlist"
    echo "\n"

    read -r -p "Are you sure you want to proceed? (y/n): " response
    case "$response" in
        [yY][eE][sS]|[yY]) # Accept 'y', 'Y', 'yes', 'YES', etc.
            return 0  # User confirmed, proceed
            ;;
        *)
            return 1  # User declined, exit
            ;;
    esac
}

if confirm; then
    echo "Proceeding with the file rename..."

    find $dir -depth -name '*[<>:"/\\|?*]*' |
    while IFS= read -r f; do
      mv -v "$f" "$(echo "$f" | tr -d '<>:"/\\|?*')"  # This will remove the unsupported characters
    done

else
    echo "Operation cancelled."
    exit 1
fi


