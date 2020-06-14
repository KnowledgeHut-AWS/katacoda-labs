#Input, Output and Error Redirections

## Input, Output and Error Redirections
Normally when a command is executed on command line, it requires input, produce output and throw an error message.

In output, a command can produce a desired output or throw an error or does not produce any output.

when you are giving a command as input via command line or via a file, is called input. Result of execution of that command is called output.
In case command through an error then it will go to a file or on screen.

`ls -l devops`{{execute}}

This command will through an error stderr (as covered in earlier topics). This command through an error as file does not exist.

We want to capture the output and error messages so that we can analyze this info and if require, take necessary action.

we have read about redirect operator >.

Now let's deep deep dive a bit. 

`>` notation is used to redirect stdout to a file.

`2>` notation is used to redirect stderr.

`&>` notation is used to redirect both stdout and stderr.


when executing our backup script, we have noticed an extra message 

`tar: Removing leading `/' from member names` 

This message was sent to stderr descriptor.

We can use 2> redirection to send them to /error/null. error is sub directory under user directory.

So let's first create sub-directory under user directory

`mkdir script_error`{{execute}}

`cd script_error`{{execute}}

`mkdir null`{{execute}}

`cd ..`{{execute}}

`pwd`{{execute}}


Now let's modify our backup script.

`vi newbackup.sh`{{execute}} 

Press 'i'


`#!/bin/bash`{{execute}}

`# Modified backup script`{{execute}}

`input_directory=/root/user`{{execute}}

`output_file=/root/user/backup/backup_$(date +%Y-%m-%d_%H%M%S).tar.gz`{{execute}}

`tar -czf $output_file $input_directory 2>/root/user/script_error/null/error.txt`{{execute}}

`echo "Backup of $input is completed as requested! Please find the details of the output backupfile.:"`{{execute}}

`ls -l $output`{{execute}}


Please note that in tar command we are using 2> to redirect stderr to a /script_error/null. Assume this is a data sink which discards any data sent to it.

After executing this new script you will not see stderr message.

Now press Esc key + :wq followed by enter key

`ls -l `{{execute}}


`chmod +x newbackup.sh`{{execute}}


`./newbackup.sh`{{execute}}



Now we want to read commands from a file.

`cat > file1.txt`{{execute}}

now keep on typing some text and once you have few lines, press CTRL+D.

Now run this commands

`cat < file1.txt`{{execute}}

So first `cat` command reads my keyboard input and converts them in to stdout which is immediately redirected to file1.txt. That is until we press CTRL+D

Later we cat command read input from file1.txt using `<` 



