#!/bin/bash
Ask the user for their first name
echo "Enter your first name:"
read -r FIRST_NAME

# Ask the user for their last name
echo "Enter your last name:"
read -r LAST_NAME

# Create a file named output.txt
touch output.txt

# Write the current date using DD-MM-YYYY format overwriting the file
date +%d-%m-%Y > output.txt

# Append first and last name to the file
echo "${FIRST_NAME} ${LAST_NAME}" >> output.txt

# Backup the output.txt file to a new backup.txt file
cp output.txt backup.txt

# Print the content of output.txt file
cat output.txt