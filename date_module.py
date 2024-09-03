
menu = {
    "Appetizers": {
        "Wings": {
            "Ingredients": ["Chicken", "Garlic", "Teriyaki"],
            "Price": 8,
            "Description": "These are the best wings in the world!"
        },
        "Sliders": {
            "Ingredients": ["Beef", "Cheese", "Bun"],
            "Price": 9,
            "Description": "Three juicy sliders, hot and fresh!"
        },
        "Cauliflower Bites": {
            "Ingredients": ["Cauliflower", "Buffalo Sauce", "Panko"],
            "Price": 7,
            "Description": "Crispy, crunchy, oooh so tasty, and healthy-ish!"
        }
    },
    "Mains": {
        "Bento Box": {
            "Ingredients": ["Tuna", "Rice", "Vegetables"],
            "Price": 18,
            "Description": "Quick, light and delicious!"
        },
        "Burrito": {
            "Ingredients": ["Bulgogi", "Tortilla", "Rice"],
            "Price": 16,
            "Description": "Tender marinated beef cuts make this burrito sing!"
        },
        "Eggplant Lasagna": {
            "Ingredients": ["Eggplant", "Mozzarella", "Ponzu"],
            "Price": 21,
            "Description": "Roasted eggplants and creamy mozzarella with a kiss of ponzu!"
        }
    },
    "Desserts and Drinks": {
        "Soda": {
            "Flavors": ["Coke", "Sprite", "Fanta"],
            "Price": 2,
            "Description": "Thirst quenched"
        },
        "Tiramisu": {
            "Ingredients": ["Chocolate", "Ladyfingers", "Cream"],
            "Price": 7,
            "Description": "So indulgent, you deserve it!"
        },
        "Boba": {
            "Ingredients": ["Tea", "Milk", "Boba"],
            "Price": 5,
            "Description": "You're reading this so what are you waiting for, order one!"
        }
    }
}

#https://www.w3schools.com/python/python_ref_dictionary.asp

#https://www.programiz.com/python-programming/nested-dictionary
def view_menu():

    for course, c_info in menu.items():
        print(f"\n{course}:")
        
        for dish, dish_info in c_info.items():
            print(f"   {dish}:")
            
            for details, d_info in dish_info.items():
                print(f"    {details}: {d_info}")

def set_course():
    course = input("\nWhat course would you like to begin with?: ")
    return course

def get_course(course):

    if course in menu.keys():
        return True
    elif course in {"Menu","menu"}:
        view_menu()
        return False  
    else:
        print("\nPlease choose from one of the courses: Appetizers, Mains, Desserts and Drinks.\nIf you would like to see the menu again enter 'menu'.")
        return False   
            
def set_dish():
    dish = input("\nI would like the: ")
    return dish

def get_dish(course,dish):

    if dish in menu[course].keys():
        return True  
    elif dish in {"Menu","menu"}:
        view_menu()
        return False  
    else:
        print("\nPlease choose from one of the dishes.\nIf you would like to see the menu again enter 'menu'.")
        return False 

def get_price(course,dish):
    price = menu[course][dish]["Price"]
    return price

def tally(price,budget,course,dish):
    if price < budget:
        result = budget - price
        print(f"\nGreat! The {dish} from the {course} is a wonderful choice!\nYour budget after ordering the {dish} is ${result}.")
        return result

def order_more(budget):
    while True:
        choice = input("\nWould you like to order more? (Y/N): ")
        
        if choice in {"Y", "y"}:
            # Select a course
            while True:
                course = set_course()
                if get_course(course):
                    break
            
            # Select a dish
            while True:
                dish = set_dish()
                if get_dish(course, dish):
                    break
            
            # Get the price and update the budget
            price = get_price(course, dish)
            new_budget = tally(price, budget, course, dish)
            
            # Check if the dish was affordable
            if new_budget is not False:
                budget = new_budget  # Update the budget with the remaining amount
            else:
                continue  # If not affordable, continue the loop

        elif choice in {"N", "n"}:
            print("\nYour food will be out soon, thank you!")
            break
        else:
            print("Please select Y or N.")

    return budget



# def order_more():
#     choice = input(f"\nWould you like to order more {date}?(Y/n): ")
#     if choice in {"Y", "y"}:
#         set_course()
#         get_course(course)
#         set_dish()
#         get_dish(course,dish)
#         get_price(course,dish)
#         tally(price,budget,course,dish)  
#     elif choice in {"N", "n"}:
#         print("\nYour food will be out soon, thank you!")
#     else:
#         print("Please select Y or N.")


# x = menu.items()
# y = menu.keys()
# z = menu.values()

# print(y)

#print(menu["Appetizers"]["Cauliflower Bites"]["Price"])