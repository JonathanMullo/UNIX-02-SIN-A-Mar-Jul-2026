#!/bin/bash
# Saves the first argument provided by the user in the terminal into the 'NAME' variable.
NAME="${1}"
# Saves the second argument provided by the user in the terminal into the 'DOMAIN' variable.
DOMAIN="${2}"
# Defines the name of the file where the ping results will be saved.
OUTPUT_FILE="results.csv"
# Checks if the NAME variable is empty (-z) OR (||) if the DOMAIN variable is empty.
if [[ -z "${NAME}" ]] || [[ -z "${DOMAIN}" ]]; then
  # Prints a warning message indicating that arguments are missing.
  echo "You must provide two arguments to this script."
  # Shows an example of how to use the script. '${0}' is automatically replaced by the script's name.
  echo "Example: ${0} mysite nostarch.com"
  # Terminates the script execution and returns an error code (1) to the operating system.
  exit 1
# Closes the conditional block for argument validation.
fi
# Writes the column headers. The '>' operator creates or overwrites the file, deleting its previous content.
echo "status,name,domain,timestamp" > ${OUTPUT_FILE}
# Pauses the script for 30 seconds so we can monitor the process before it executes the ping.
sleep 30
# Executes a ping sending only 1 packet (-c 1) to the domain. '&> /dev/null' hides the ping output to keep the console clean.
if ping -c 1 "${DOMAIN}" &> /dev/null; then
  # If the ping was successful, it appends (>>) a line to the file with the 'success' status, variables, and current date/time.
  echo "success,${NAME},${DOMAIN},$(date +'%d-%m-%Y %H:%M:%S')" >> "${OUTPUT_FILE}"
else
  # If the ping failed, it appends (>>) a line to the file with the 'failure' status, variables, and current date/time.
  echo "failure,${NAME},${DOMAIN},$(date +'%d-%m-%Y %H:%M:%S')" >> "${OUTPUT_FILE}"
# Closes the conditional block for the ping result.
fi