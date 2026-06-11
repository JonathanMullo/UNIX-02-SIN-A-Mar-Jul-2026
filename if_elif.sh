#!/bin/bash
# Store the first argument in USER_INPUT
USER_INPUT="${1}"
# Check if USER_INPUT is empty
if [[ -z "${USER_INPUT}" ]]; then
# Print an error message
 echo "You must provide an argument!"
# Exit the script with error code 1
 exit 1
# End of the condition
fi
# Check if USER_INPUT is a file
if [[ -f "${USER_INPUT}" ]]; then
# Print that it is a file
 echo "${USER_INPUT} is a file."
# Check if USER_INPUT is a directory
elif [[ -d "${USER_INPUT}" ]]; then
# Print that it is a directory
 echo "${USER_INPUT} is a directory."
# Execute if it is neither a file nor a directory
else
# Print that it is not a file or directory
 echo "${USER_INPUT} is not a file or a directory."
# End of the condition
fi
