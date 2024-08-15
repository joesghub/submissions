#BASH- Log Script
#Due Wednesday by 8:59pm Points 12 Submitting a website url Available after Aug 14 at 4pm
#As a DevOps engineer at Zanbil.ir, you are responsible for maintaining the smooth operation of the website. 

#You've set up various monitoring alarms to notify you of unusual activities that could indicate potential issues or security threats.

#Recently, one of your alarms was triggered due to an unusual spike in network activity. 
#Upon further investigation, you noticed that there has been a significant increase in the number of "404 Not Found" errors. 
#A 404 error occurs when a user tries to access a page that doesn't exist on the server, 
#which could be a sign of someone probing your site for vulnerabilities or simply a misconfigured application.

#Your task is to investigate these 404 errors, focusing on identifying which IP addresses are responsible for these errors and how frequently they happened.

#To begin: Run the following command to download a file with server access logs:
#$curl -O https://c5databucket.s3.amazonaws.com/web-server-access-logs.logLinks to an external site.

#Create a BASH script that will search the log file for "404" errors and identify the IP addresses associated with them.  
#Then provide the number of times each IP encountered a 404.

#Be sure to use conditional statements and loops in your script.  

#Please submit a link to your GH Repo for this assignment.

#Designating the file to search
web_logs="/home/ubuntu/bash_prac/web-server-access-logs.log"

if [ -f "$web_logs" ]
then
	grep "error_expected" "$web_logs" | awk -F'[" ]+' '{print $2}' | sort | uniq -c | sort -b -n > web_logs_errors.txt
	echo "The file $web_logs exists and a log has been created!"
fi


#find all the files with error (5)

#grep -m5 "error_expected" web-server-access-logs.log

#select only the ip address from the files with error codes (5) and output to a text file

#awk -F'[" ]+' 'NR<=5 {print $2}' web-server-access-logs.log > .txt

#Sort and count the list 

#awk -F'[" ]+' '{print $2}' first_five.txt | sort | uniq -c | sort -b -n





