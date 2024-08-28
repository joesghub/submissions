########################PROMPT##########################
# As an Entry Level DevOps Engineer, you are tasked with creating a user-friendly script that can be run from the terminal for a user to easily get important system information.

# Create a script that will present the following menu to a user to choose from:

# 1. IP Addresses #ex answer: "Your private IP is 172.31.1.150, and you public IP is 3.235.129.224."
# 2. Current User #ex answer: "You are ubuntu."
# 3. CPU Information #ex answer: "The system has 1 CPU." 
# 4. Memory Information #ex answer "There is 330 Mebibyte unused memory of total 957 Mebibyte."
# 5. Top 5 Memory Processes #This can be a table that's produced by a command, ex answer:

# "pmem   pid       cmd 
#  2.9        8047    /usr/lib/snapd/snapd
#  2.7        181      /sbin/multipathd -d -s
#  2.3        664      /usr/bin/python3 /usr/share/unattended-upgrades/unattended-upgrade-shutdown --wait-for-signal
#  2.1        516      /usr/bin/python3 /usr/bin/networkd-dispatcher --run-startup-triggers
#  1.6        524      /snap/amazon-ssm-agent/7993/amazon-ssm-agent"

# 6. Top 5 CPU Processes #Same as above
# 7. Network Connectivity #ask user for a website or IP address to connect to first and then produce a statement regarding the network connection, ex answer: "It took 7ms to connect to www.google.com and there was 0% data packet loss."

# The script should continue to ask the user to choose from the menu until they want to exit.
########################WORK#########################
# 1. IP Addresses #ex answer: "Your private IP is 172.31.1.150, and you public IP is 3.235.129.224."
#https://www.cyberciti.biz/faq/bash-shell-command-to-find-get-ip-address/
# private_ip=hostname -I
# public_ip=$(host myip.opendns.com resolver1.opendns.com | awk 'FNR>=6 {print $4}')

# # 2. Current User #ex answer: "You are ubuntu."
# user=$(whoami)

# # 3. CPU Information #ex answer: "The system has 1 CPU." 
# # https://www.tecmint.com/commands-to-collect-system-and-hardware-information-in-linux/#:~:text=How%20to%20View%20Linux%20System,kernel%20name%20of%20your%20system.&text=To%20view%20your%20Linux%20network,the%20uname%20command%20as%20shown.
# cpu=$(lscpu | awk 'FNR==5 {print $2}')

# # 4. Memory Information #ex answer "There is 330 Mebibyte unused memory of total 957 Mebibyte."
# free_mem_kb=$(cat /proc/meminfo | grep "MemFree:" | awk '{print $2}')
# free_mem_mb=$(($free_mem_kb/1000))
# avail_mem_kb=$(cat /proc/meminfo | grep "MemAvailable:" | awk '{print $2}')
# avail_mem_mb=$(($avail_mem_kb/1000))

# # 5. Top 5 Memory Processes #This can be a table that's produced by a command, ex answer:

# # "pmem   pid       cmd 
# #  2.9        8047    /usr/lib/snapd/snapd
# #  2.7        181      /sbin/multipathd -d -s
# #  2.3        664      /usr/bin/python3 /usr/share/unattended-upgrades/unattended-upgrade-shutdown --wait-for-signal
# #  2.1        516      /usr/bin/python3 /usr/bin/networkd-dispatcher --run-startup-triggers
# #  1.6        524      /snap/amazon-ssm-agent/7993/amazon-ssm-agent"

# top_mem=$(LINES=12 top -b -o %MEM -n1 -w | awk 'FNR>=7 {print $1,$10,$12}')


# # 6. Top 5 CPU Processes #Same as above
# top_cpu=$(LINES=12 top -b -o %CPU -n1 -w | awk 'FNR>=7 {print $1,$9,$12}')

# # 7. Network Connectivity #ask user for a website or IP address to connect to first and then produce a statement regarding the network connection, 
# #ex answer: "It took 7ms to connect to www.google.com and there was 0% data packet loss."

# read -p "Please enter a url or ip address for whihc you would like the network connection status: " url
# net_millisec=$(ping -c 1 "$url" | awk 'FNR==5 {print $10}')
# net_packet=$(ping -c 1 "$url" | awk 'FNR==5 {print $6}')


echo $'\n'"Hello! This script allows you to see important system information. Please select from the options below:"$'\n'

PS3=$'\n'"I would like to view: "
choices=("IP Addresses" "User Info" "CPU Info" "Memory Info" "Memory Processes" "CPU Processes" "Network Connectivity" "Exit")
select option in "${choices[@]}"
do
    case $option in
        "IP Addresses")
            echo $'\n'"You chose $REPLY, $option"          
            private_ip=$(hostname -I)
			public_ip=$(host myip.opendns.com resolver1.opendns.com | awk 'FNR>=6 {print $4}')
            echo $'\n'"The IP Addresses for this machine are: Public IP $public_ip Private IP $private_ip"
            ;;
        "User Info")
            echo $'\n'"You chose $REPLY, $option"          
            user=$(whoami)
            echo $'\n'"The current User for this machine is: $user"
            ;;
        "CPU Info")
            echo $'\n'"You chose $REPLY, $option"          
            cpu=$(lscpu | awk 'FNR==5 {print $2}')
            echo $'\n'"The CPU amount for this machine is: $cpu"
            ;;
        "Memory Info")
            echo $'\n'"You chose $REPLY, $option"          
            free_mem_kb=$(cat /proc/meminfo | grep "MemFree:" | awk '{print $2}')
            free_mem_mb=$(($free_mem_kb/1000))
            avail_mem_kb=$(cat /proc/meminfo | grep "MemAvailable:" | awk '{print $2}')
            avail_mem_mb=$(($avail_mem_kb/1000))
            echo $'\n'"There is $free_mem_mb MB of memory free out of $avail_mem_mb MB total"
            ;;
        "Memory Processes")
            echo $'\n'"You chose $REPLY, $option. Below are the top 5 processes consuming memory: "        
            top_mem=$(LINES=12 top -b -o %MEM -n1 -w | awk 'FNR>=7 {print $1,$10,$12}')  
            echo $'\n'"$top_mem"
            ;;
        "CPU Processes")
            echo $'\n'"You chose $REPLY, $option. Below are the top 5 processes consuming cpu: "        
            top_cpu=$(LINES=12 top -b -o %CPU -n1 -w | awk 'FNR>=7 {print $1,$9,$12}')  
            echo $'\n'"$top_cpu"
            ;;
        "Network Connectivity")
            echo $'\n'"You chose $REPLY, $option."        
            read -p $'\n'"Please enter a url or ip address for which you would like the network connection status: " url
            net_millisec=$(ping -c 1 "$url" | awk 'FNR==5 {print $10}')
            net_packet=$(ping -c 1 "$url" | awk 'FNR==5 {print $6}')
            echo $'\n'"It took $net_millisec to reach $url and there was $net_packet data packet loss."
            ;;
        "Exit")
            #exits the script
            exit
            ;;
        #The * pattern acts as a catch-all for anything that doesn't match the listed patterns
        *) 
            echo "You enetered $REPLY, but we need to pick from one of the types above!"
            # ';;' Terminates the command block for each pattern
            ;;
    esac
done
