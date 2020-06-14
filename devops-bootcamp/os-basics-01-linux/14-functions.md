# Functions

Functions allow a programmer to efficiently reuse its code by organizing it in such a way that if he/she needs to perform same activity again, he can call the function and use it. It increased efficiency, execution speed as well as readability of the script.

It is also possible to write entire script without function. However you may end up with a inefficient, hard to maintain , hard to read and understand code so making it very hard to troubleshoot it.

In other words, a function is a collection of different commands in to a single command. For example if you need to do a sum multiple time in a script, then we can define sum function and where-ever we need to calculate sum, we will just pass the input and get the output.
 
Functions are defined by using the function keyword and followed by function body enclosed by curly brackets.


Let's define a function.

`vi print_function.sh`{{execute}}

press 'i'

`#!/bin/bash`{{execute}}

`function print_user_info {`{{execute}}

`	echo " User Name: $(whoami)"`{{execute}}

`}`{{execute}}


`print_user_info`{{execute}}


Press Esc key and :wq followed by enter.

`chmod +x print_function.sh`{{execute}}

`./print_function.sh`{{execute}}


Now let's further extend our backup script.

Now let's modify our backup script.

`vi newbackup.sh`{{execute}} 

Press 'i'


`#!/bin/bash`{{execute}}

`# Modified backup script`{{execute}}

`input_directory=/root/user`{{execute}}

`output_file=/root/user/backup/backup_$(date +%Y-%m-%d_%H%M%S).tar.gz`{{execute}}

`# The function total_files reports a total number of files for a given directory.`{{execute}}

`function count_files {`{{execute}}
        
`		find $1 -type f | wc -l`{{execute}}

`}`{{execute}}

`# The function total_directories reports a total number of directories`{{execute}}

`# for a given directory. `{{execute}}

`function count_directories {`{{execute}}

`        find $1 -type d | wc -l`{{execute}}

`}`{{execute}}

`tar -czf $output_file $input_directory 2>/root/user/script_error/null/error.txt`{{execute}}

`echo -n "Files to be included in the back up are :"`{{execute}}

`count_files $input_directory`{{execute}}

`echo -n "Directories to be included in the back are :"`{{execute}}

`count_directories $input_directory`{{execute}}

`echo "Backup of $input is completed as requested! Please find the details of the output backupfile.:"`{{execute}}

`ls -l $output`{{execute}}


Please note that in tar command we are using 2> to redirect stderr to a /script_error/null. Assume this is a data sink which discards any data sent to it.

After executing this new script you will not see stderr message.

Now press Esc key + :wq followed by enter key

`ls -l `{{execute}}


`chmod +x newbackup.sh`{{execute}}


`./newbackup.sh`{{execute}}
