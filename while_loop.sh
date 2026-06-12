#!/bin/bash
# Define the name of the file that will signal the loop to stop
SIGNAL_TO_STOP_FILE="stoploop"
# Continue looping until the signal file is created
while [[ ! -f "${SIGNAL_TO_STOP_FILE}" ]]; do
    # Notify that the signal file has not been found yet
    echo "The file ${SIGNAL_TO_STOP_FILE} does not yet exist..."
    # Inform the user about the next check interval
    echo "Checking again in 2 seconds..."
    # Wait for 2 seconds before checking again
    sleep 2
done
# Exit once the signal file is detected
echo "File was found! Exiting..."