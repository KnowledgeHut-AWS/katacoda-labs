# Simple Backup Bash Shell Script

## Backup Bash Shell Script

Let's develop a basic back up script, a routine work which we need to do every day or quite frequently.

We want to take back up of a directory including all files and sub directories. We will be using tar command for it.

Let's first create some files and sub-directories.


`dir`{{execute}}

`ls -l`{{execute}}

`mkdir user`{{execute}}

`cd user`{{execute}}

`touch backupfile1.txt`{{execute}}

`mkdir subdir1`{{execute}}

`mkdir backup`{{execute}}

`cd subdir1`{{execute}}

`touch backupfile2.txt`{{execute}}

`ls -l`{{execute}}

you should see you backupfile2.txt`{{execute}}

`cd ..`{{execute}}


So now we have few files and sub directories.

`vi backupscript.sh`{{execute}}

Now press i, then add folllowing command 

`#!/bin/bash`{{execute}}

`tar -czf /root/user/backup/myhomebackup.tar.gz  /root/user`{{execute}}

Now press Esc key and :wq , press enter.

`ls -l`{{execute}}


So now we have few files and sub directories.

`chmod +x backupscript.sh`{{execute}}

`./backupscript.sh`{{execute}}

Now you should have a file in backup directory.

This may give an error -  

`tar: Removing leading `/' from member names` 

Ignore this error for time being.




