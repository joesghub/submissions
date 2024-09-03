####PROMPT#####
# Create a date.py script that is a date simulator and does the following:

# User inputs who is on the date with them
# User inputs their budget for the date
# Print the restaurant menu (your group created this!) 
# User inputs their food/drink item choices from a restaurant menu list (for themselves and their date)
# Script tells the user how much money they have left after each order.
# At the end of the date user must agree to pay the bill and then their final budget is shown to them.
# Challenge: Based on all the user inputs, 
# the script should decide whether the user will get a second date or not and tell the user the decision. 

####WORK#####

# User inputs who is on the date with them
# def makeadate(date)

# # User inputs their budget for the date
# def makeadate(date, budget)
#https://www.w3schools.com/python/python_user_input.asp

# Print the restaurant menu (your group created this!) 
# print(menu)
# pprint.pprint(menu)

# User inputs their food/drink item choices from a restaurant menu list (for themselves and their date)

# Script tells the user how much money they have left after each order.

# At the end of the date user must agree to pay the bill and then their final budget is shown to them.


# Challenge: Based on all the user inputs, 
# the script should decide whether the user will get a second date or not and tell the user the decision. 

import pprint
import date_module


def makeadate():
    print("Hello! What a lovely couple! Are you excited to plan your date?")
    #Printing intro
    host = input("\nWhat is your name: ")
    #Stored host name using input command
    date = input("\nWhat is the name of your date: ")    
    #Stored date name
    print(f"\nPleasure to meet you, {host}. We can't wait for your date with {date}!")

    while True:
    #Initiates a true while loop ensuring that the program continues to ask the user until they enter a valid option 
        
        h_budget = input(f"\n{host}, how much would you like to spend?: ")
        #Stores budget variable in uses f-string formatting to make script interactive. 
        
        if h_budget.isdigit() == True:
        #Checks if input is comprised of digits [.isdigit()]. If true, prints the budget out
            print(f"\n{host}, your budget is ${h_budget}.")  
            #Prints the host budget with their name
            h_budget = int(h_budget)
            break
            #If the condition is met, the loop is broken and progresses forward in the script
        else:
        #If the input is not digits, receives this statement and asks inital question again
            print("\nPlease select a whole dollar value.")

    while True:
        d_budget = input(f"\nHow much would {date} like to spend?: ")
        
        if d_budget.isdigit() == True:
            print(f"\n{date}, your budget is ${d_budget}.")  
            d_budget = int(d_budget)
            break
        else:
            print("\nPlease select a whole dollar value.")
    while True:
        view_menu = input("\nWould you like to see the menu? (Y/N): ")
        
        if view_menu in {"Y", "y"}:
            date_module.view_menu()  
            break
        elif view_menu in {"N", "n"}:
            print("\nNo problem, you must come here often!")
            break
        else:
            print("Please select Y or N.")

    print(f"\nNow that you've seen the menu, it's time to make your selections!\nWe will start with {date}'s order.")

    while True:
        course = date_module.set_course()
        if date_module.get_course(course) == True:
            print(f"\nGreat, what would you like from the {course}!")
            break

    while True:
        dish = date_module.set_dish()
        if date_module.get_dish(course,dish) == True:
            break

    if d_budget > 0:
        price = date_module.get_price(course,dish)
        new_budget = date_module.tally(price,d_budget,course,dish)
        if new_budget > 0:
            d_budget = new_budget
            date_module.order_more(d_budget)
        else:
            print(f"\nUnfortunately, your budget of ${d_budget} won't allow for ${price} {dish}.\nPlease choose another dish!")
            date_module.order_more(d_budget)

     
makeadate()

# User inputs their food/drink item choices from a restaurant menu list (for themselves and their date)

# Script tells the user how much money they have left after each order.

# At the end of the date user must agree to pay the bill and then their final budget is shown to them.


# Challenge: Based on all the user inputs, 
# the script should decide whether the user will get a second date or not and tell the user the decision.

# x = 2

# match x:
#     case 1:
#         print("x is 1")
#     case 2:
#         print("x is 2")
#     case _:
#         print("x is neither 1 nor 2")

# match view_menu:
#     case "Y" | "y":
#         pprint.pprint(menu)
#     case "N" | "n":
#         print("Ok, have a great day!")
#     case _:
#         print("Please select Y or N.")

