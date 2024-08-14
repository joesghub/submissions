#!/bin/bash

#Write a script to check if a file is readable, writable, and executable.

# Readable variable
readable="r"

#Writable variable
writeable="w"

#Executeable variable
executable="x"

#Check file permissions
ls -l

#Read the permissions
grep

for file in *
	if ls -l | grep $readable 
	then
		echo "The file $file is $readable"
	elif ls -l | grep $writeable
	then
		echo "The file $file is $writeable"
	elif ls -l | grep $executable
	then
		echo "The file $file is $executable"
