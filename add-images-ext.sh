#!/bin/bash

# Loop through all files in current directory
for f in *; do
    # Skip if it's a directory
    [[ -d "$f" ]] && continue

    # Skip if file already has an extension (contains a dot)
    [[ "$f" == *.* ]] && continue

    # Check if it's actually a file
    if [[ -f "$f" ]]; then
        # Get the file type
        filetype=$(file --mime-type -b "$f")

        # Only process if it's an image
        if [[ "$filetype" == image/* ]]; then
            # Determine extension based on MIME type
            case "$filetype" in
            image/jpeg) ext="jpg" ;;
            image/png) ext="png" ;;
            image/gif) ext="gif" ;;
            image/webp) ext="webp" ;;
            image/bmp) ext="bmp" ;;
            image/tiff) ext="tiff" ;;
            image/svg+xml) ext="svg" ;;
            *) ext="img" ;;
            esac

            # Clean the filename - remove only * and - characters
            clean_name=$(echo "$f" | sed 's/[*-]//g')

            # Make sure we have a valid name (not empty)
            if [[ -z "$clean_name" ]]; then
                clean_name="image_$(date +%s)"
            fi

            # Rename the file
            new_name="${clean_name}.${ext}"

            # Handle duplicate names
            counter=1
            while [[ -f "$new_name" ]]; do
                new_name="${clean_name}_${counter}.${ext}"
                ((counter++))
            done

            mv "$f" "$new_name"
            echo "Renamed: $f -> $new_name"
        else
            echo "Skipped (not an image): $f (type: $filetype)"
        fi
    fi
done
