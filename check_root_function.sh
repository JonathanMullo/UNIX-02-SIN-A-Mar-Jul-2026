#!/bin/bash
# Define a function to check if the current user is root
check_if_root(){
# Check if the effective user ID (EUID) is 0
if [[ "${EUID}" -eq "0" ]]; then
# Return 0 indicating the condition is true
 return 0
# Execute if the user is not root
 else
# Return 1 indicating the condition is false
 return 1
# End of the condition
 fi
# End of the function
}
# Execute the check_if_root function
if check_if_root; then
# Display a message indicating the user is root
 echo "User is root!"
# Execute if the function returns false
else
# Display a message indicating the user is not root
 echo "User is not root!"
# End of the condition
fi
# EUID (Effective User ID) stores the ID of the user executing the script; root always has ID 0
EUID