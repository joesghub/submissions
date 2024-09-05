# Write a Python function that calculates the uptime percentage of a service 
# based on the total number of hours and the number of hours the service was down. 
# The function should take 2 parameters(total hours and down hours, inputted when the function is run). 
# Lastly, the function should return the uptime percentage rounded to two decimal places. 

def service_uptime():
    total_hours = input("\nLet's calculate uptime percentage of a service!\nHow many hours was the service up?: ")
 
    try:
        total_hours.isdigit() == True
        total_hours = int(total_hours)
        print(f"Your service was up for {total_hours} hours. Congrats!")
        return total_hours
    except:
        total_hours.isdigit() == False
        print("Please enter a numerical value.")

    down_hours = input("\nHow many hours was the service down?: ")

    try:
        down_hours.isdigit() == True
        down_hours = int(down_hours)
        print(f"Your service was down for {down_hours} hours. Oh no!")
        return down_hours
    except:
        down_hours.isdigit() == False
        print("Please enter a numerical value.")

    diff = total_hours - down_hours
    uptime = round(diff, 2)
    perc = down_hours / total_hours
    print(f"\nThe total uptime for your service was {uptime} hours.\nThe service was up {perc}% of the total time.")

service_uptime()