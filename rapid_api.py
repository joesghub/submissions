# Choose an API from RapidAPI that interests you—make sure it has a free tier and simple authentication. 
# Write a Python script that makes a request to your selected API, using the appropriate endpoint and parameters to retrieve data. 
# Save the response data to a variable, and handle it as JSON to work with nested structures. 
# Extract a specific item from the nested dictionary in the response, and print a statement that meaningfully displays this information. 
# Have fun exploring the data you retrieve!


import requests
import json

def select_recipe():
	while True:
		choice = input("\nWelcome to Joe's Vegan Meals Grocery List app!\nWe aim to encourage healthy eating that starts with easy shopping!\n\nPlease enter a recipe ID (1-384) for which you would like a grocery list!: ")

		#Checks if the numeric value of choice is within the valid range (1 to 384)
		if choice.isdigit() and 1 <= int(choice) <= 384:
			return int(choice)
		else:
			print("\nPlease enter a recipe ID from 1 - 384")

recipe_id = select_recipe()

url = (f"https://the-vegan-recipes-db.p.rapidapi.com/{recipe_id}")

headers = {
	"x-rapidapi-key": "327fa44544msh6d4898ce411e810p1753dejsne25e7fcb7fd2",
	"x-rapidapi-host": "the-vegan-recipes-db.p.rapidapi.com"
}

response = requests.get(url, headers=headers)

#It's good practice to check if the API request was successful before attempting to process the data
if response.status_code == 200:

	#response.json() is already a dictionary
	read_recipe = response.json()

	#I previously used the keys method to explore the output, so I knew which keys to enter for the desired values
	print(f"The items you will need to make {read_recipe['title']} are: ")
	for ingredient in read_recipe['ingredients']:
		print("__ ",ingredient)
	print("\nI hope it tastes delicious! Boneappleteeth!")
else:
	print("\nI wish we could get you your recipe now, but you'll have to try again later. Happy shopping!")


### I tested writing the response output to a file then working on the file to build my code around a static response. ###

#resp = response.json()
#recipe = json.dumps(resp)

# f = open( '/home/ubuntu/submissions/submissions/Testing/recipe.py', 'w' )
# f.write( recipe )
# f.close()

# recipe = open('/home/ubuntu/submissions/submissions/Testing/recipe.py', 'r')
# read_recipe = json.load(recipe)
#print(type(read_recipe))
#print(read_recipe.keys())
#print(type(read_recipe['ingredients']))
#print(read_recipe['ingredients'])


### REFERENCE METHODS ###

### Convert into JSON:
# y = json.dumps(read)

### Open and read the JSON file
# with open('data.json', 'r') as file:
#     data = json.load(file)

### Opening JSON file
# f = open('data.json')

### Returns JSON object as a dictionary
# data = json.load(f)

### Closing file
# f.close()

