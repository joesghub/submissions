#!/bin/bash

#Objective: 
#In this activity, you will create your own text-based "Create Your Own Adventure story" using Bash scripting. 

#You will apply your knowledge of 
#loops and conditionals to 
#make the story interactive, 
#allowing the player to make choices that affect the outcome.

#Welcome user to the app
echo $'\n'"Hello Friend! It's time to play Overwatch! If you are not familiar with the game, think of it as a team vs team battle!"

#Explaining the gameplay
echo $'\n'"Two teams of three players try to capture a location by attacking and defending with their powers."
echo $'\n'"The teams start at different points and travel to the locations marked on a map then battle to secure the spot!"

#Getting user's name
read -p $'\n'"I hope you're excited to get started? What is your name so we can get going!"$'\n'"My name is: " name 
echo 

#Confirming user's name
echo $'\n'"Pleasure to meet you $name!"

#Explaining how the types works
echo $'\n'"In Overwatch there are three types of characters: Strength, Speed, and Health."$'\n'"Strength beats Health, Health beats Speed, and Speed beats Strength!"

#Choosing a type
echo $'\n'"With that, it's time to choose a type!"$'\n'

# In Bash, the PS3 prompt is used for the built-in select command, which displays interactive menus. It's the third of five prompt strings that can be customized in Bash: 
# PS0: Displays after each command, before any output 
# PS1: The primary prompt, displayed before each command 
# PS2: The secondary prompt, displayed when a command needs more input 
# PS3: The prompt for the select built-in 
# PS4: Displays when debugging bash scripts to indicate levels of indirection 
# Unlike the other prompts, PS3 doesn't expand Bash escape sequences. To use PS3, you can set the $PS3 environment variable to a new value before the select statement. You can also modify the prompt within the loop to change it as the loop progresses. 
#https://www.google.com/search?q=why+ps3+prompt+bash&oq=why+ps3+prompt+bash&gs_lcrp=EgZjaHJvbWUyBggAEEUYOdIBCDI5ODVqMGo3qAIAsAIA&sourceid=chrome&ie=UTF-8

PS3=$'\n'"Please select your type: "

#List of options I want to include in my select statement
types=("Strength" "Speed" "Health" "End Game")

#Begins select command by cycling through each item in types list "${types[@]}"
select option in "${types[@]}"
#Starts a loop to hold out cases for the select command options held in types
do
    #Creates nested cases for the first three options
    case $option in
        #detailing the commands to follow when the user chooses Strenght type
        "Strength")
            #Prints the user's choice with a blank line before ($'\n')
            echo $'\n'"You chose 1: Strength!"
            #Blank line
            echo 
            #Storyline about choice and prompt for next decision. I call the user's name with the variable $name 
            echo "Standing at the front of the team, $name leads the charge. You see an opponent trying to sneak to the right of the team?! What do you do?"
            #Preparing the promtpthat will be shown after the choices
            PS3=$'\n''I want to: '
            #Storing the choices in a variable for the select command to iterate through
            choices=("Follow the opponent to proctect my team!" "Stick with the team to provide coverage!" "End Game")
            #Iterating through coices 
            select option in "${choices[@]}"
            #Starts a loop to hold out cases for the select command options held in choices
            do
                case $option in
                    "Follow the opponent to proctect my team!")
                        echo $'\n'"You chose to do $REPLY, $option"
                        echo 
                        echo "You follow the opponent to the right and realize its an ambush! However, player you are chasing is a Health type and they are really close to you...What do you do?"
                        PS3=$'\n'" I'm going to: "
                        choices=("Fall back and regroup with my team so we can get to the point as a group." "Take out the Health player to get an advantage on the other team. I trust my group!" "End Game")
                        select option in "${choices[@]}"
                        do
                            case $option in
                                "Fall back and regroup with my team so we can get to the point as a group.")
                                    echo $'\n'"You chose to do $REPLY, $option"
                                    echo "You meet your team and as you get to the point you hear footsteps approaching from behind... The Health opponent is attacking your Speed teammate. You turn around to help but get taken out by the Speed player who went straight past the point! It was a valiant effort, but game over :'("
                                    exit
                                    ;;
                                "Take out the Health player to get an advantage on the other team. I trust my group!")
                                    echo $'\n'"You chose to do $REPLY, $option"
                                    echo "You succesfully take out the Health opponent and skillfully push the Strength character back to the point. Your teammates have taken out the Speed opponent and you all converge to defeat the Strength player. You win!"
                                    exit
                                    ;;
                                #End game choice case comands
                                "End Game")
                                    #exits the script
                                    exit
                                    ;;
                                #The * pattern acts as a catch-all for anything that doesn't match the listed patterns
                                *) 
                                    echo "You enetered $REPLY, but we need to pick from one of the types above!"
                                    #Terminates the command block for each pattern
                                    ;;
                            esac
                        done
                        ;;
                    "Stick with the team to provide coverage!")
                        echo $'\n'"You chose to do $REPLY, $option"
                        echo 
                        echo "Good call! Your opponent's team is very skilled and set traps along your route. As you travel to the point together, your teammate suggests you follow suit and lay traps. Is that a good idea?"
                        PS3=$'\n''I think: '
                        choices=("If you can't beat them, join them!" "We have our own tricks up our sleeves!" "End Game")
                        select option in "${choices[@]}"
                                    do
                                        case $option in
                                            "If you can't beat them, join them!")
                                                echo $'\n'"You chose to do $REPLY, $option"
                                                echo "More traps?! The team gets off track trying to set more traps and ends up failing to secure the point in time. Your oppenents have out-schemed you and won."
                                                exit
                                                ;;
                                            "We have our own tricks up our sleeves!")
                                                echo $'\n'"You chose to do $REPLY, $option"
                                                echo "You stick to your guns and secur ethe point first. Your defense and support are impenetrable and yu opponents yeild to time. What a way to win!"
                                                exit
                                                ;;
                                            "End Game")
                                                exit
                                                ;;
                                            *) 
                                                echo "You enetered $REPLY, but we need to pick from one of the types above!"
                                                ;;
                                        esac
                                    done
                                    ;;
                                "End Game")
                                    exit
                                    ;;
                                *) 
                                    echo $'\n'"You enetered $REPLY, but we need to pick from one of the types above!"
                                    ;;
                            esac
                        done
                        ;;
        "Speed")
            echo $'\n'"You chose 2: Speed"
            echo 
            echo "Float like a butterfly and sting like a bee. $name went ahead and chose the type Speed! Bursting out the gate you make your way to the point but the team is lagging behind...What do you do?"
            PS3=$'\n'"I'm going to: "
            choices=("The early bird gets the worm. They'll meet me there!" "Slow and steady wins the race. Let's wait up!" "End Game")
            select option in "${choices[@]}"
                        do
                            case $option in
                                "The early bird gets the worm. They'll meet me there!")
                                    echo $'\n'"You chose to do $REPLY, $option"
                                    echo "Good things come to those who wait! But not in this case. You get to the point and find the Strength opponent there?! Where's their team? Who knows, and who cares! One down and the rest of their team arrives to get obliterated. Match over, you win!"
                                    exit
                                    ;;
                                "Slow and steady wins the race. Let's wait up!")
                                    echo $'\n'"You chose to do $REPLY, $option"
                                    echo "You wait. And you wait. And you wait, some more...Your teammates are still picking their characters, ughhhh! Match over, if you can even call it that. Your opponents came, saw no one, and conquered. We lose."
                                    exit
                                    ;;
                                "End Game")
                                    exit
                                    ;;
                                *) 
                                    echo "You enetered $REPLY, but we need to pick from one of the types above!"
                                    ;;
                            esac
                            done
                            ;;
        "Health")
            echo $'\n'"You chose $REPLY: $option"
            echo 
            echo "Healers are the realest ones, ya know! $name chooses a Health type and is an expert in 'Silent, but Deadly Healthy'. We arrive at the point and its guns blazing! Your teammates are weak, but the opposing Health player is so close to dying. Do you?"
            PS3=$'\n''I will: '
            choices=("Take the shot!" "Heal 'em up!" "End Game")
            select option in "${choices[@]}"
                        do
                            case $option in
                                "Take the shot!")
                                    echo $'\n'"You chose to do $REPLY, $option"
                                    echo "Bullseye! You take out the Health opponents and tip the balance in your teams favor. Risky, risky, but it paid off! You win!"
                                    exit
                                    ;;
                                "Heal 'em up!")
                                    echo $'\n'"You chose to do $REPLY, $option"
                                    echo "Clutch move! Your expert healing skills give your teammates the boost they need to take out their counter parts. You line up your shot and take out the Health opponent as they run to find a hiding spot. LOL. Man, I love this game! Win!"
                                    exit
                                    ;;
                                "End Game")
                                    exit
                                    ;;
                                *) 
                                    echo "You enetered $REPLY, but we need to pick from one of the types above!"
                                    ;;
                            esac
                        done
                        ;;
                    "End Game")
                        exit
                        ;;
                    *) 
                        echo $'\n'"You enetered $REPLY, but we need to pick from one of the types above!"
                        ;;
                esac
            done
            ;;
        "End Game")
            break
            ;;
        *) 
            echo $'\n'"You enetered $REPLY, but we need to pick from one of the types above!"
            ;;
    esac
done


# PS3="Enter a number: "

# select character in Sheldon Leonard Penny Howard Raj
# do
#     echo "Selected character: $character"
#     echo "Selected number: $REPLY"
# done