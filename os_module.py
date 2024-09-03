# Create a Python script that counts the number of items (files and directories) in a specified directory(take dir as input). 
# The script should display the total number of items (both files and directories) present in the specified directory. 
# Bonus Modify your script to count the number of files and directories separately. Hint: use the os module

import os

#prints current working directory
def pwd():
    direc = os.getcwd()
    print(f"The current working director is: {direc}")

#Collects directory input
def end_dir():
    result = input("What directory would you like to go to?")
    print("We will go to the", result, "directory" )

#List contents of the current working directory
def list_dir():
    global contents
    contents = os.listdir()
    print("The current working director contains these items")
    for item in contents:
        print(f"{item}")

#Counter of items in list
def count_items(lst):
    count = 0
    for item in lst:
        count += 1
    return count

# Next I would save the contents of the list in a variable that I would pass int my count_items function. 

# The goal would be to: 
# First, show the user the current directory with pwd()
# Then, use end_dir() to get the directory we want to count
# Next, we would need to pass the directory variable into the list_dir() function
# After, the list_dir() would show the items and give us a variable to pass into our count_items() function
# Finally, the count_items() function would return the number of items in the selected directory