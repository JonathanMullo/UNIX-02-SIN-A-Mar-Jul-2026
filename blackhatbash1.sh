#!/usr/bin/env bash
bash --version
set -x
env
set +x
echo ${SHELL}
echo ${RANDOM}
echo ${UID}
echo ${OSTYPE}

# PART2
ps -ef
df --human-readable
bash -r blackhatbash1.sh
# Displays syntax errors if any are foun
bash -n blackhatbash1.sh
# Runs the script in debug mode
bash -x blackhatbash1.sh

