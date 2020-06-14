# Variables

## Variables

A variable is a character string to which we assign a value. The value assigned could be a number, text, filename, device, or any other type of data. The name of a variable can contain only letters (a to z or A to Z), numbers ( 0 to 9) or the underscore character ( _).

To define a variable 


`variable_name = variable_value`


To access the value stored in a variable, prefix its name with the dollar sign ($) −


`$variable_name`


Variables are the core of any computer programming. Variables are used to store data, modify data, and (re)use them in the whole program.

There are some pre defined variables which are are used at various places. 



Let's explore it further.

On your terminal run this command and let's see what is the outcome.

`whoami`{{execute}}

This gives you the user name which is used to login to your session.

`date`{{execute}}

This gives you today's date.

Now if we want to today's day
`day=$(date +%A)`{{execute}}

`echo $day`{{execute}}

Bash version

`echo $BASH_VERSION`{{execute}}

This will give bash version in your terminal.

Let's see you want to greet someone, then we can define a variable and assign a value.

`greeting="This is a sample greeting message"`{{execute}}

`echo $greeting  `{{execute}}


Now that we have some basics of variables. Let's use them in our script and how it can help us writing a good reusable script.


Let's create a new script with `vardemo.sh`

`vi vardemo.sh`{{execute}}

Press 'i' to activate insert mode

`#!/bin/bash`{{execute}}

`greeting="Hello DevOps Enthusiast!"`{{execute}}

`user=$(whoami)`{{execute}}

`day=$(date)`{{execute}}

`echo "$greeting . Your user id is $user! Today is $day. Today we are learning basics of Operating System!"`{{execute}}

`echo "Your Bash shell version is: $BASH_VERSION. Enjoy your class!"`{{execute}}


now press Esc key followed by :wq

`ls -l`{{execute}}


`chmod +x vardemo.sh`{{execute}}


`./vardemo.sh`{{execute}}

We have used a combination of variables and commands. You can see that it gives us a lot more agility. We can customize it without rewriting everything from scratch.



Now let's customize our back up script. I am assuming that you still have a user sub directory under root. If not then please follow previous steps to create files and directory structure. If not then you can change input_directory name and output_file name as mentioned in the script. 

|- root
	
	|--user

		|----backup

		|----subdir1




		
`clear`{{execute}}		
		
`vi newbackup.sh`{{execute}}

Press 'i' to activate insert mode.


`#!/bin/bash`{{execute}}

`# Modified backup script`{{execute}}

`input_directory=/root/user`{{execute}}

`output_file=/root/user/backup/$backup_home_$(date +%Y-%m-%d_%H%M%S).tar.gz`{{execute}}

`tar -czf $output_file $input_directory`{{execute}}

`echo "Backup of $input is completed as requested! Please find the details of the output backupfile.:"`{{execute}}

`ls -l $output`{{execute}}

Now press Esc key + :wq followed by enter key

`ls -l `{{execute}}


`chmod +x newbackup.sh`{{execute}}


`./newbackup.sh`{{execute}}
