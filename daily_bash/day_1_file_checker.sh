#!/bin/bash

# Write a script that takes a filename as an argument and checks if it exists. 
# If it exists, print its size.

# Output Example:

# $ ./check_file.sh example.txt
# Checking if 'example.txt' exists...
# File 'example.txt' exists.
# Size of 'example.txt': 15 KB

#Create a variable to accept the file name
read -p $'\n'"What is the name of the file you would like to check?: " check_file

echo $'\n'"Currently checking if "${check_file}" exists..."

# Exit Code 1 means the search was completed, but no file matching the criteria was found.
# Exit Code >1 (e.g., 2) usually indicates an error, such as a permission issue or a syntax error.

# /dev/null is a special device file that discards anything written to it (essentially a "black hole").
# So, [ > /dev/null ] prevents anything normally printed by the command from appearing in the terminal.

# Standard error is the output stream where error messages are sent.
# 2>&1 tells the shell to send error messages (2 refers to stderr) to the same location as standard output (1 refers to stdout). 
# Since stdout is already being sent to /dev/null, this means both normal output and error messages will be discarded

### Previous iterations
# if find / -name "${check_file}" > /dev/null 2>&1
# find / -iname ""${check_file}"" -print -quit 2>/dev/null
# if [ -e "${check_file}" ] > /dev/null 2>&1
# if [ -e "${check_file}" ]

found_file=$(find / -iname "${check_file}" -print 2>/dev/null)

if [ -n "$found_file" ]
then
    echo $'\n'"File "${check_file}" exists!"
    sleep 2
    # This gives the size of the file in bytes directly without capturing other information like the file name.
    # byte_size=$(wc -c < "${found_file}") 
    byte_size=$(wc -c "${found_file}" | awk '{print $1}')
    kb_size=$((${byte_size} / 1024))
    echo $'\n'"Size of "${check_file}": "${kb_size}"kb"
else
    echo $'\n'"The file "${check_file}" does not exist."
fi