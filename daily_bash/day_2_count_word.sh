# Write a script that 
# counts the occurrences 
# of a specific word chosen by the user 
# in a given text file.

# Output Example: 

# $ ./count_word.sh document.txt
# Enter the word you want to count: example
# Counting occurrences of 'example' in document.txt...
# The word 'example' occurs 5 times in document.txt.
# $ ./count_word.sh document.txt
# Enter the word you want to count: apple
# Counting occurrences of 'apple' in document.txt...
# The word 'apple' occurs 0 times in document.txt.
# $ ./count_word.sh non_existent_file.txt
# Error: The file 'non_existent_file.txt' does not exist. Please provide a valid file.

file="$1"

read -p $'\n'"Enter the word you want to count: " word

found_file=$(find / -iname "${file}" -print 2>/dev/null)

if [ -n "$found_file" ]
then
    word_count=$(grep -c "${word}" "${found_file}")
    echo $'\n'"Counting occurrences of '"${word}"' in "${file}"..."
    sleep 2
    echo $'\n'"The word '"${word}"' occurs "${word_count}" time(s) in "${file}"."
else
    echo $'\n'"Error: The file '"${file}"' does not exist. Please provide a valid file."
fi



