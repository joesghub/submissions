#!/bin/bash

#Write a script that checks if a directory named "backup" exists in the current directory. 
#If it does not exist, create it.

#Check for a directory named backup in the current directory


for directory in *
#Checks each directory in the vm
until [[ $directory == "backup" ]]
#Checks if the directory is named backup
do
	echo "This $directory is not named backup"
	#States the directory does not exist
	if [[ $directory == "backup" ]]
	#When the directory is named backup
	then
		echo "A directory named "backup" exists!"
		#It found the directory named backup
	else
		mkdir backup
		#Create the backup folder
done
