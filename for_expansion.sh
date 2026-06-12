#!/bin/bash
# Loop through all files that match the pattern "example_file*"
for file in example_file*; do
    # Check if the current file is "example_file1"
    if [[ "${file}" == "example_file1" ]]; then
        # Inform that this file will be skipped
        echo "Skipping the first file"
        # Skip the rest of this iteration and move to the next file
        continue
    fi
    # Overwrite the file with a random number
    echo "${RANDOM}" > "${file}"
done