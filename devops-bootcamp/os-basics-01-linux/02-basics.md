# Basics
## Basic commands for DevOps

#### echo
This command can be used to display the line of text that is passed as an argument. 

`echo "Welcome to DevOps Bootcamp !!"`{{execute}}

There are many options with alomost all commands. You do not need to remember these options. You can refer to manual or online help using `man ` command. We will talk about this command shortly.

`man echo`{{execute}}
 
#### pwd

This command can be used to show present working directory. pwd stands for present working directory.

`pwd`{{execute}}

 
#### cd

This command can be used to change direcotory.

`cd \etc`{{execute}}

#### man

man command is used to get help on any command. 

`man echo`{{execute}}

`man du`{{execute}}

There are many options available with each command. We may not be able to cover all of them but for any command you can get help using man <command> then it will give you more info about various options.


#### xargs

xargs

In layman's terms, the tool - in its most basic form - reads data from standard input (stdin) and executes the command (supplied to it as an argument) one or more times based on the input read. Any blanks and spaces in the input are treated as delimiters, while blank lines are ignored. 

If no command is supplied as an argument to xargs, the default command that the tool executes is echo. 


Assuming you have a list of files, and you wish to know the number of lines/words/characters in each file in the list, you can use ls command and xargs for this purpose as follows.

`ls *upload* | xargs wc`


Xarags also allows you to find and recursively remove a directory, for example the following command will recursively remove DomTerm in the directory Downloads.


`find Downloads -name "DomTerm" -type d -print0 | xargs -0 /bin/rm -v -rf "{}" `

There are many possibilities. User can make their own custom combinations of commands with xargs to solve their problems.
