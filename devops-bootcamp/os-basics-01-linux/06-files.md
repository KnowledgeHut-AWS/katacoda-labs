# Filesystems

Ok, we'll start this by finding out where we are in the filesystem by looking at the present working directory with the
`pwd`{{execute}} command. The same information is stored in the `$PWD` environment variable.

```
echo $PWD
```{{execute}}

To see it. To make a directory use `mkdir mydir`, where `mydir` is the name of the directory you want to create. You can use
the `-p` flag to supress errors if the directory already exists or if you want to create a hierarchy (tree) of directories:

```
mkdir -p one/two/three/four/five/six/seven/eight/nine/ten
```{{execute}}


You can change to other directories using `cd`{{execute}}, but without an argument it'll take you to your home directory,
which is often refered to as `~` (tilda) or the variable $HOME. You can go back through your directory history and revisit
directorys you have left using `cd -`{{execute}}. Check it out:

```
cd one/two/three/four/five
```{{execute}}

Then

```
cd -
```{{execute}}

Then

```
cd -
```{{execute}}

See, `cd -` changes to the previous directory and therefore flips between the last two directories you visited.

## I'm touched that you care 
You can create a file by 'touching' a new filename, or if the file already exists you can use this command to update its timestamp.
We often use something like `touch myscript.sh`{{execute}} to create a file before editing it. Of course, if it's a script
then...

## Never touch me without my permission
You can check permission on a file by looking at a 'long' directory listing using `ls -l`. Those symbols on the right
are the file type and permissions to access a file from the owner, group, and other users (in that order).

![Linux permissions](https://cdn.thegeekdiary.com/wp-content/uploads/2017/11/Files-permissions-and-ownership-basics-in-Linux.png)

If it is a script that you want to execute, for example, then you want to make it executable at least for you, but often
for everybody. To do this we use the `chmod a+x myscript.sh`{{execute}} command. This gives 'all' users executable permissions
on the named file. You can add other permissions, and assign them to a restricted group of users if you'd like. If you'd like
to give read, write, and execute permssions only to yourself you could write `chmod o+rwx myscript.sh`{{execute}}, where 
the `o` represents 'owner', and the other switches are pretty obvious I think.

That output doesn't include all the files in a directory. Some of them are 'hidden', which means that they start with a `.`. To
see them you have to `ls -a`{{execute}}, for all. But, that also lists the current and parent directories using the special symbols
`.` and `..`, which are always present (except in the root directory `/` which has no parent). You can remove them from the listing (because
they're pointless -- get it, dots, points... never mind), by using `ls -A`{{execute}} (almost all), which is like `-a` in that it shows hidden files
(all) but without those two special directories. 

## I'm only human after all
A lot of commands show big numbers in bytes. You can make most of them human readable using the `-h` flag. For example, the
directory listing `ls -Al`{{execute}} is more digstable if you include it there, `ls -Alh`{{execute}}. You can make it easier
to determine the type of the file too if you add a `-F` for filetype, which adds a symbol at the end of some files, such as
an `*` to indicate executable files. Try it, it's cool: `ls -AlFh'. You can make the long listin easier to read again by 
excluding the owner and group, using `ls -gAGFh'{{execute}}. (pronounced gagfuh). (not really).

## Whats in a name?
We can find the filename or directory at the end of a path with `basename /home/$USER/.bashrc`{{execute}}, or something similar,
and we can get the path for that same file using `dirname /home/$USER/.bashrc`. These two commands are really useful when
playing with file locations in an automation script.

Be aware that filenames in linux can contain all sorts of weird symbols, even some that make the file totally inaccessible 
ever again, so be careful with your commands. While you're playing around on your own system you may want to consider trying
things out in a docker container. You can get a useful one using the following command:

```
docker container run -it --rm ubuntu
```{{execute}}
  
Or, build your own dockerfile and configure your own version of ubuntu or alpine to match your exact needs.

### Show me what you got?

You can dump a file to `stdout` using the `cat` command. If you were to execute `cat ~/.bashrc`{{execute}} you'd see the
contents of that file splayed out in your terminal. If the file is too long you can page it using `less`. Let's try that now
using our history to generate a long file.

```
history > history.txt
history >> history.txt
history >> history.txt
less history.txt
```{{execute}} 

With `less` you can use `q` to quit, `space` to page and the arrow keys to move up and down. Like `man` (which is ultimately 
the same tool) you can search using `/` and get lots of help with `h`. Try it out now. Remember, `q` quits help too :)

## Digital means copyable
You can rename copy a file with the `cp` command, like this:

```
cp history.txt myhistory.txt
ls -gGAFh *history.txt
```{{execute}}

## This is all very moving
and you can move a file or rename it with the `mv` command, like this:

```
mv myhistory.txt ancient-history.txt
ls -gGAFh *history.txt
```{{execute}}

```
mkdir history-backup
mv ancient-history.txt history-backup
ls -gGAFh *history.txt
ls -gGAFh history-backup
```{{execute}}

## Finding things that were once lost
There is a command that searches the filesystem for the files or directories you specify. Quite suprisingly, given that this
is linux and nothing is simple or has a simple name, this tool is called `find`. Although it has an easy name, it does not
have a simple interface. In fact, it can get quite complex...

To simply find a file, you specify the starting point (`.` in this example -- the current directory), and the name of the
file, `*.java` in the first eample.

```
touch one/two/three/four/five/six/myjavafile.java
find . -name *.java
```{{execute}}}

But, this can get confusing if you happen to have files and directories with the same names and you have a large search space,
so we can search by file type too. This is also useful if, for example, you want to find all the executable files. In the
first example we will find only files

```
touch one/two/three/four/five/one
find . -name one
```{{execute}}}
This creates a file called on in the directory called five. I know that's confusing, but so is linux file-handling so you
better hang on to your hats because its going to get curiouser in a couple of moments. Then it searches for files named one.
It finds both the directory and the file, but if we want to find just the file we can constrain the search to only find
files, rather than directories

```
touch one/two/three/four/five/one
find . -type f -name one
```{{execute}}}

Or, just the directory

```
touch one/two/three/four/five/one
find . -type d -name one
```{{execute}}}

## X-Ray vision
We can go deeper though, we can find files with only specific content using a tool called `grep`. This name comes from
**g**lobal searches using a **re**gular expression and **p**rinting the matches. 