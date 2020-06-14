# Bash Shell Scripting

### What is Shell?

A shell is special user program which provide an interface to user to use operating system services. Shell accept human readable commands from user and convert them into something which kernel can understand. It is a command language interpreter that execute commands read from input devices such as keyboards or from files. The shell gets started when the user logs in or start the terminal. In other words Shell is a macro processor which allows for an interactive or non-interactive command execution. "Shell" is a program, which facilitates the interaction between the user and operating system (kernel). 

There are many shells available, like sh, bash, csh, zsh...etc.


### What is Bash

Bash is a command language interpreter. It is widely available on various operating systems and is a default command interpreter on most GNU/Linux systems. The name is an acronym for the ‘Bourne-Again SHell’.

###  What is scripting?

Usually shells are interactive. A user enter an command and shell execute it. Sometime we want to run a bunch of commands together and many times it becomes a repetitive actions. Rather then giving commands manually, we can also write these commands in a file and execute these commands in shell to avoid this repetitive tasks. These files are called Shell Script. Each shell script file is saved as .sh file.

### what is bash scripting?

When a user is using bash shell and writing code in bash shell is called bash scripting. To check our default interpreter, please execute this command

`echo $SHELL`{{execute}}

In order to define script's interpreter as bash, we need to insert its executable binary with shebang #! at start of the script.

`#! /bash/bin`{{execute}}

As discussed earlier file permission, there three types of permission read, write and execute. Bash Shell Script file need execute permission. By default, any newly created shell script file does not have execute permission. Hence we may need to change the file permission.

In order to check the file permission, you can run following command, assuming you are in the directory where the file is 

` ls -l`{{execute}}

if file does not have execute permission then user can run this command to give execute rights.

` chmod +x filename `{{execute}}

If we have included the shebang #! and bash path then simply running

./filename will execute the command

Another way to execute this, without the need to make the script executable and without declaring shebang, is by calling bash explicitly followed by filename.sh


`bash filename.sh`{{execute}}



