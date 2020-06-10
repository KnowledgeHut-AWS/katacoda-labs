# Files & Directories
## File management in Bash
---
Files are collections of bits or characters stored in directories/folders (those terms are interchangeable). Let's start by looking at directories...

### Home sweet home
Every linux user has a home directory, let's move to ours. To do so we use `cd`{{execute}} (try it now). We can see what the current directory, called the working directory, is by issuing the command `pwd`{{execute}} or outputting the `$PWD` variable: `echo $PWD`{{execute}}. The home directory is where bash looks for its initialisation scripts, which start with one called .bashrc (more about that later).

Your home directory can also be referred to by the symbol `~`, which is called 'Tilda', or by the variable `$HOME`.

### Create new directories
To create a new directory called 'wibble' we would type `mkdir wibble`{{execute}} (I use the term 'wibble' a lot, because its fast to search for with few false positive results). To create a set of nested directories all at once we would use the `-p` flag like this `mkdir -p src/main/java`{{execute}}. The `-p` flag also promises to never throw an error, which can be quite a useful feature when creating directories in a script. Once a directory is created we can move to it `cd src/main/java`{{execute}}. 

### Files
In Linux almost everything is a file. A file is actually a pointer to a collection of bytes, and some very strange things are classed as files in Linux. We can create an empty file using the command `touch`, as in `touch myfile.txt`{{execute}}. 


