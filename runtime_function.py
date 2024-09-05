# Write a Python function that calculates the uptime percentage of a service 
# based on the total number of hours and the number of hours the service was down. 
# The function should take 2 parameters(total hours and down hours, inputted when the function is run). 
# Lastly, the function should return the uptime percentage rounded to two decimal places. 

def get_total_hours():
    while True:
        total_hours = input("\nLet's calculate uptime percentage of a service!\n\nHow many hours was the service running in total?: ")
        try:
            total_hours = float(total_hours)
            return total_hours
        except ValueError:
            print(f"The total amount of hours you entered {total_hours} is not a digit.")


def get_down_hours():
    while True:
        down_hours = input("\nHow many hours was the service down?: ")

        try:
            down_hours = float(down_hours)
            return down_hours
        except ValueError:
            print(f"The amount of hours down you entered {down_hours} is not a digit.")

def service_uptime():
                
    total_hours = get_total_hours()

    down_hours = get_down_hours()
    
    diff = total_hours - down_hours
    uptime = round(diff, 2)
    perc = (diff / total_hours) * 100

    print(f"\nThe total uptime for your service was {uptime} hours.\nThe service was up {perc}% of the total time.")

service_uptime()

    # if isinstance(total_hours, (int, float)):
    #     print(f"total hours {total_hours} is a digit")
    # else:
    #     print(f"total hours {total_hours} is not a digit")
    #     return  

    # if total_hours.isdigit():
    #     total_hours = int(total_hours)
    #     print(f"Your service was up for {total_hours} hours. Congrats!")
    # else:
    #     print("Please enter a numerical value.")
    #     return

    # down_hours = input("\nHow many hours was the service down?: ")

    # if down_hours.isdigit():
    #     down_hours = int(down_hours)
    #     print(f"Your service was down for {down_hours} hours. Oh no!")
    # else:
    #     print("Please enter a numerical value.")
    #     return

    # diff = total_hours - down_hours
    # uptime = round(diff, 2)
    # perc = (diff / total_hours) * 100

    # print(f"\nThe total uptime for your service was {uptime} hours.\nThe service was up {perc}% of the total time.")

