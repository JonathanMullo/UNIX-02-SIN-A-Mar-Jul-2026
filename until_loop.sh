#!/bin/bash
Define the name of the file that will be monitored.
FILE="output2.txt"
# Create the file if it does not exist.
touch "${FILE}"
# Repeat the loop until the file contains data (size greater than zero).
until [[ -s "${FILE}" ]]; do
# Notify that the file is still empty.
    echo "${FILE} is empty..."
# Indicate that the file will be checked again in 2 seconds
    echo "Checking again in 2 seconds..."
# Wait 2 seconds before checking again.
    sleep 2
done

#Display a message when the file contains some content.
echo "${FILE} appears to have some content in it!"