# File Contents
## File Contents

### File archiving

tar command archives the files

tar command is used with some options

-c – To create a archive


-x – Extract files from archive


-t – Display files in archive


-v – verbose


-f – name of the arch filename .tar


`ls -l`{{execute}}


Let's first create one more file in our devops2 directory

`touch samplefile2.txt`{{execute}}

use this command to create an archive 

`tar -cvf archive.tar samplefile.txt samplefile2.txt`{{execute}}

`ls -l `{{execute}}

`rm samplefile.txt `{{execute}}
`rm samplefile2.txt`{{execute}}

`ls -l `{{execute}}

We only have a tar file in our directory

To extract file from an archive
`tar -xvf archive.tar`{{execute}}


check your results with 
`ls -l `{{execute}}


### Searching a string in a file

grep command searches for a particular pattern of characters in a file , and displays all lines that contain that pattern.

`grep DevOps samplefile.txt`{{execute}}


For case insensitive search use -i option

`grep -i DEvOPS samplefile.txt`{{execute}}

### Sort the results

sort command sorts the results of a search either alphabetically or numerically. It also sorts files, file contents, and directories.

`sort samplefile.txt `{{execute}}

sort -n  returns the results as per numerical order

`sort -n samplefile.txt `{{execute}}

sort -f  returns case insensitive sorting

`sort -f samplefile.txt `{{execute}}

### File editing without opening it

sed command can find, substitute  and replace text in a file without opening it. 

`sed 's/DevOps/Linux' samplefile.txt`{{execute}}

If you want to replace first two occurance then 

`sed 's/Linux/Bootcamp/2' samplefile.txt`{{execute}}

man sed can give you more info about various options.

`man sed`{{execute}}

### Difference among files

diff command shows the difference between two files by comparing files line by line. diff uses certain special symbols to communicate required changes to make two files identical. It tells what all changes to be made in first file to make it match second file. 

a : add


c : change


d : delete

Let's create two files. 

`vi country1.txt`{{execute}}

press i to go into insert mode.

Add following text

`USA`{{execute}}

`UK`{{execute}}

`Netherlands`{{execute}}

then press Esc key ,then type :wq then enter

Now create a new file

`vi country2.txt`{{execute}}

press i to go into insert mode.

Add following text

`UK`{{execute}}

`Netherlands`{{execute}}

`Singapore`{{execute}}

then press Esc key ,then type :wq then enter


Now let's see if we can see the content of the file before we change it

 
`cat > country1.txt`{{execute}}

`cat > country2.txt`{{execute}}

`diff country1.txt country2.txt`{{execute}}

It will show the 

`1d0`
`< USA`
`3a3`
`> Singapore`

`1d0  - says that from country1.txt delete USA`
`3a3  - says to add Singapore in line 3 of country1.txt as is the case in country2.txt`


### Here Document

Using here document  or heredoc, a block of code or text can be redirected to the command script or interactive program. This can be used by bash script.

Lets say we want to use command cat.

Heredoc delimiter is DEMO


Let's first create a bash file

`vi heredoc.sh`{{execute}}


`#!/bin/bash`{{execute}}

`cat <<DEMO`{{execute}}

`This block of the text is`{{execute}}

`added using Here Document example`{{execute}}

`DEMO`{{execute}}

save this file by pressing esc , :wq , enter key

now run this command

`bash heredoc.sh`{{execute}}




