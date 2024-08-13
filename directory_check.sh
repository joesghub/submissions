#!/bin/bash

#Write a script that checks if a directory named "backup" exists in the current directory. 
#If it does not exist, create it.

#Check for a directory named backup in the current directory

#Checks each directory in the vm
for directory in *
#checks if the directory is named backup
until [[ $directory == "backup" ]]
do
	echo "This $directory is not named backup"
then
	mkdir backup
else
	echo "A directory named "backup" exists!"
done