#!/bin/bash

#Detects new files made in a specific directory
#Push the changes to a repo in GH
#If the repo doesn't exist, it asks the user if they would like to create one
#Then pushes to GH

#Path to directory
read -p $'\n'"What directory would you like to check?: " directory

#Checks if directory exists 
#Added quotes around ${directory}: To handle directories with spaces correctly.
if [ -d "${directory}" ]
then
    echo $'\n'"The directory "${directory}" exists"
else
    echo $'\n'"The diretcory does not exist"
    exit 1
fi

#Find the new files added to the directory by parsing the git status
#(grep -v) This prints out all the lines that do not matches the pattern
#The $ in the grep -v '/$' pattern is a regular expression (regex) symbol that represents the end of a line.
#https://git-scm.com/docs/git-status
new_files=$(git status -s "${directory}" | grep -v "/$" | awk '{ print $2 }')

#The -n option in the conditional [ -n "$new_files" ] checks whether the string inside the variable "$new_files" is non-empty.

if [ -n "$new_files" ]
then
    echo $'\n'"New files detected:"$'\n'${new_files}
else
    echo $'\n'"No new files detected."
fi

#Push new files to GH repo. Creates a new one and pushes if does notexist
git_check=$(git status "${directory}")

if "$(git_check)" 
then
    for file in "${new_files}"
    git_add=$(git add "${file)")
    git_commit=$(git commit -m "Adding '${file}'")
    git_count=0 
    do
        git_add
        echo $'\n'"New file "${file}" added"
        git_commit
        echo $'\n'"New file "${file}" committed"
        git_count= $((git_count + 1))
    done
        if [ ${git_count} -eq 0 ]
        then
            git push
            echo $'\n'"Changes pushed to GitHub"
        fi
else
    git_init=$(git init "${directory}")
    PS3=$'\n'"This directory is not a repository in Github. Would you like to add it?")
    choices=("Yes" "No")
    select option in "${choices[@]}"
        do
            case $option in
                "Yes")
                    git_init
                    echo $'\n'"'${directory}' initialized in Github"
                    ;;
                "No")
                    echo $'\n'"'${directory}' has not been initialized in Github"
                    ;;
                *) 
                    echo "You enetered $REPLY, but we need to pick from one of options above"
                    ;;
            esac
        done



# Write a script that takes a filename as an argument and checks if it exists. If it exists, print its size.

# Output Example:

# $ ./check_file.sh example.txt
# Checking if 'example.txt' exists...
# File 'example.txt' exists.
# Size of 'example.txt': 15 KB

        

