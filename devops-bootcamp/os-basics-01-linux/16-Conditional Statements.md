# Conditional Statements

## Conditional Statements

In this section, are going to discuss about conditional statements in bash shell scrpting. Using these statement, we can add more logic to our scripts. Fundamental concept is that if certain conditions meets then excute certain other steps.  if not then do something else.


We are going to discuss these three conditionals - `if`, `then` and `else`. For example, we can improve our backup script by comparing number of files exist in the source directory and resulting backup file. If both number matches then only our backup is taken correctly. Otherwise something is not correct.\


Let's take few simple examples. We want to compare two numbers ( number1 and number2) and then compare if number1 is less than number 2 , if yes then print number1 is less than number 2. However if above condition is not true then print - Number 1 is greater than number2.


`vi numbercomparator.sh`{{execute}}


press `i` 


`#!/bin/bash`{{execute}}

`number1=100`{{execute}}

`number2=200`{{execute}}

`if [ $number1 -lt $number2 ]; then`{{execute}}

`    echo "$number1 is less than $number2!"`{{execute}}

`else`{{execute}}

`   echo "$number1 is greater than $number2!"`{{execute}}

`fi`{{execute}}


`Press Esc , :wq , then enter key


`Now let's give execute persmission to the script.


`chmod +x numbercomparator.sh`{{execute}}

`./numbercomparator.sh`{{execute}}


the Psuedocode for this  kind of backup script will be something like this 

If number of files source directory and traget file is same then print `OK` else print 'An error has occurred`

Let's further enhance our backup script.

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


`function total_count_archived_directories {`{{execute}}

`        tar -tzf $1 | grep  /$ | wc -l`{{execute}}

`}`{{execute}}


`function total_count_archived_files {`{{execute}}

`        tar -tzf $1 | grep -v /$ | wc -l`{{execute}}

`}`{{execute}}


`tar -czf $output_file $input_directory 2>/root/user/script_error/null/error.txt`{{execute}}


`source_files=$( count_files $input )`{{execute}}

`source_directories=$( count_directories $input )`{{execute}}


`total_archived_files=$( total_count_archived_files $output )`{{execute}}

`total_archived_directories=$( total_count_archived_directories $output )`{{execute}}

`echo "Files to be included: $source_files"`{{execute}}

`echo "Directories to be included: $source_directories"`{{execute}}

`echo "Files archived: $total_archived_files"`{{execute}}

`echo "Directories archived: $total_archived_directories"`{{execute}}

`if [ $source_files -eq $total_archived_files ]; then`{{execute}}

`echo "Backup of $input is completed as requested!"`{{execute}}

`echo "Please find the details of the output backupfile.:"`{{execute}}

`ls -l $output`{{execute}}

`else`{{execute}}
 
`	 echo "Backup of $input failed. please check !"`{{execute}}

`fi`{{execute}}

`echo "Total files to be included in the back up are :"`{{execute}}

`count_files $input_directory`{{execute}}

`echo "Total directories to be included in the back are :"`{{execute}}

`count_directories $input_directory`{{execute}}


Now press Esc key + :wq followed by enter key

`ls -l `{{execute}}


`chmod +x newbackup.sh`{{execute}}


`./newbackup.sh`{{execute}}

In this script we have added additional function to include total number of files and directories included in the backup.




