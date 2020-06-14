# Files & Directories
## File management in Bash
---
Files are collections of bits or characters stored in directories/folders (those terms are interchangeable). Let's start by looking at files and directories...

### List directories and files 

This command is used to list directory and files. 


`ls`{{execute}}


if we use -l option with it then it will give output in long list format

`ls -l`{{execute}}

`ls –gAlF`{{execute}}

This commands list almost all files in long format without showing owner 



### Copy command

cp command is used for copying files and directories from one location to another.

Lets first create some directories. 

`mkdir devops1`{{execute}}

`mkdir devops2`{{execute}}

`cd  devops1`{{execute}}

`touch samplefile.txt`{{execute}}

`ls`{{execute}}


Now that we have few directories and one sample file. We want to copy samplefile.txt from devops1 directory to devops2 directory with new name samplefilecopied.txt.


`cp samplefile.txt /root/devops2/samplefilecopied.txt `{{execute}}

`cd /root/devops2 `{{execute}}

`ls -l `{{execute}}


### Move file

mv command moves files from one directory to another directory or with in the same directory. Same command can also be used to rename the file.


Now let's move samplefilecopied.txt from devops2 directory to devops1 directory

`mv /root/devops2/samplefilecopied.txt /root/devops1/samplefilecopiedmoved.txt`{{execute}}


### Home sweet home
Every Linux user has a home directory, let's move to ours. To do so we use `cd`{{execute}} (try it now). We can see what the current directory, called the working directory, is by issuing the command `pwd`{{execute}} or outputting the `$PWD` variable: `echo $PWD`{{execute}}. The home directory is where bash looks for its initialization scripts, which start with one called .bashrc (more about that later).

Your home directory can also be referred to by the symbol `~`, which is called 'Tilda', or by the variable `$HOME`.

### Create new directories
To create a new directory called 'wibble' we would type `mkdir wibble`{{execute}} (I use the term 'wibble' a lot, because its fast to search for with few false positive results). To create a set of nested directories all at once we would use the `-p` flag like this `mkdir -p src/main/java`{{execute}}. The `-p` flag also promises to never throw an error, which can be quite a useful feature when creating directories in a script. Once a directory is created we can move to it `cd src/main/java`{{execute}}. 

### Files
In Linux almost everything is a file. A file is actually a pointer to a collection of bytes, and some very strange things are classed as files in Linux. We can create an empty file using the command `touch`, as in `touch myfile.txt`{{execute}}. 

### Remove files and directories

So now if want to remove a file then we can use rm command. First let's check if the file exist.


`cd /root/devops1`{{execute}}

`ls`{{execute}}

Now that file exist. In this case we are going to remove file samplefilecopiedmoved.txt

`rm samplefilecopiedmoved.txt`{{execute}}

`rm -rf` can remove files and directories recursively. Hence we have to be very careful when we want to use this command.

`rm -rf \root\devops1`{{execute}}

### View content of a file 


`cat` is used to view contents of a file  and display it on the output.

`cd /root/devops2`{{execute}}

`vi samplefile.txt`{{execute}}

press i

Then type some sample text - 

`I love DevOps !!!`{{execute}}

`Welcome to DevOps`{{execute}}

`This is my n-2 line`{{execute}}

`This is n-1 line`{{execute}}

`This is the last line (n)`{{execute}}


Press Esc key
then type :wq
hit enter

Now try

`cat samplefile.txt`{{execute}}

You will see the text of the file on the screen.


### View last few lines of the file

tail command is used to display the last lines of a file (by default last 10 lines)

`tail -n 2 samplefile.txt`{{execute}}

-n 2 option command will give you only last two lines of the file.


### Permissions

In order to secure directories and files in the Linux, we use permissions to control what a user is allowed to do with the files or a directories.

There are three types of permission 

Read - This permission allow a user to read only a file


Write - This permission allow a user to read, write or delete a file.


Execute - This permission allow a user to run a file

We also have permission at following level

User - This permission affects owner of the file.


Group - This permission affects the group which owns it.


Other - This permission affects the rest of the users

4 – read permission


2 – write permission


1 – execute permission


0 – no permission


let's check the permission of samplefile.txt. If does not exist then you can create a file using above mentioned commands.

`ls -l`{{execute}}

you will see the permission of samplefile.txt


`-rw-r--r-- 1 root root   71 Jun 11 06:44 sample.txt`

first bit says where it is a directory of file. d is not mentioned then it is a file.sample
Next three places shows what permission a user has, next three places shows what permission a group has and last three places shows what permission rest of the users have.

If we want to give a

user - Read and write and execute permission

Then for user, we need to sum 4 + 2+ 1 = 7

Same way we want to give Read and write option to group 

then for group it is 4+2 = 6

For others, we just want to give read access 

then for others read = 1

so we have 761 number


`chmod 761 samplefile.txt`{{execute}}


`ls -l`{{execute}}

Now you can see the permission of file has changed.

### Ownership of file

We can change the ownership of the file using chown command

`chown owner_name  file_name`

Now let's assume there is another user with name Tom. If you want to make Tom the owner of the file then we can use this command

`chown tom samplefile.txt`


### Basename

basename command prints the name of a file removing directories in the full path.

Assuming we have a file in /root/devops2/samplefile.txt

`basename /root/devops2/samplefile `{{execute}}

### Disk Free

df shows the amount of available disk space being used by file systems.


`df `{{execute}}

To get this info in more human readable form

`df -h `{{execute}}




 
### Disk Usage

du command shows the disk space used by directory trees inclusive of its content.

`du <directory_name>`

to get info in more human readable format

`du -h <directory_name>`

### Find command

find command searches for files in a directory and underlying sub-directories. It searches for files by attributes such as file name, permissions, users, groups, file type, date, size and other possible criteria.

`find /root/devops2  -name samplefile.txt `{{execute}}

### Touch a file

touch command changes file timestamp. It can also create a file if it does not exist.

`ls -l `{{execute}}

`touch samplefile.txt `{{execute}}

`ls -l `{{execute}}

Have you noticed the timestamp difference.

Let's create an empty file.

`touch devopsbootcamp.txt`{{execute}}

`ls -l `{{execute}}