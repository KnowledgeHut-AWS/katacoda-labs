# Basics 

### Messy terminals

At certain point we may want to clean your screen. For that we can use `clear`{{execute}} command,
or you can type ctrl-l (which is easier and quicker; and won't get you shouted at by the instructor for wasting time ;).
If your instructor is shouting 'clear' at you, then hit ctrl-l and you'll be safe; delay and all will be lost in a torrent
of insults :D.

If your terminal is in a total mess, and the clear command isn't working and everything is rapidly falling down the White
Rabbit's hole, then you should issue the `reset`{{execute}} command to return your terminal to its pristine state.

## Stopping things quickly

To stop a running command you can usually type `ctrl-c`. Because this is 'paste' in most systems (including linux's UIs) the 
paste shortcut is often remapped to either `shift-ins` (insert), or `ctrl-shift-v` (which I prefer). If you are on a macbook with 
linux installed you're still going to have problems. You won't buy one of them again, will you? Let's try ending a process
now. The process we'll try with is `top`{{execute}} (it views system resources). It runs forever, so when you get bored
of looking at all the wonderful data it displays, kill it by typing `ctrl-c`.

To exit a terminal (or other command with a prompt) you should type `ctrl-d`, which is the same as typing `exit`. If you 
want to try this, first let's start another shell inside this one. Type `bash`{{execute}} (yes, it's that easy) to start
another bash shell. You can check this out with `ls -gAlFh`{{execute}} which should show you a formatted list of 
the contents of your home directory. If you want to exit that command prompt, kill that shell session, and return to its 
parent, you can type `exit`{{execute}}. If you do that, open another session (`bash`{{execute}}), do something
again -- `cat ~/.bashrc`{{execute}}, then exit the session with `ctrl-d`. If you're vigilent, you'll notice the word
`exit` flashing up at the bottom of the terminal as you exit. `ctrl-d` just inserts the word exit.

## Escalating privileges
You an become a boss by using the `sudo` command. This runs a command as the super-user, or system administrator, or `root`. 
Usually you have to be `root` to install things and to change permissions. `Root` is a user. This can get you into a lot
of difficulties with file permissions, so use it with care. One usecase is for docker, but we prefer not to run docker
as `root` because it gives it too many privileges, so we would rather add our current user to the docker group (which is)
another linux thing we'll be looking at later, hopefully. If I can be bothered typing that much. Maybe I'll just mention
it in class instead ;)

## I'm missing something important here...
If you're missing a command that you need, you can install it using your distro's package manager. In Ubuntu that's called
the Advanced Package Tool (`apt`), and in Alpine it's invoked with APK (`apk`) which seemingly doesn't really stand for 
anything except the phrase 'a pack' which refers to the package files it downloads (as in "What does apk do? It downloads 
a pack").

In Ubuntu:

```
sudo apt update
sudo apt install -y jq
```{{execute}}

The `-y` simply stops it from asking for permission to install something. Sudo makes you the boss so that you can install 
something. `jq` we'll cover in depth later, but it's a json query tool.

In alpine (which you can get at with `docker container run --it --rm alpine`{{execute}}) you can do this:

```
apk add bash jq
```

You can list multiple packages to install with either tool. Ultimately they all work a similar way, but alpine is primarily
used in scripts so it doesn't default to a human centric view of the world and therefore doesn't need permissions to install
something. Ubuntu is rather behind from this perspective.

## Can you give me more background?
Commands (or 'jobs') jcan be run in the foreground or background. Sometimes it is useful to switch between the two. To run 
a command in the background just put an `&` (ampersand) at the end of the command. This can get messy if the command has 
lots of output so be careful with this command. An example would be `ping google.com &`{{execute}}. If you hit enter on that
you'll be sent back to the comand prompt, but the output keeps coming. (`ping` uses an internet management protocol to confirm
if a server is responsive or not -- it is the most basic way to check that we 'reach' a server).

To bring a bacground job to the foreground you can issue the `fg`{{execute}} command. This will bring job #1 to the foreground, 
but if you use the command `jobs`{{execute}} to list all background jobs you can put the job number after `fg` to bring a
specific job to the foreground instead. 

This technique is less useful in environments where we can open many terminal windows, but we do use it often in automation
scripting and to run many independant tasks in parallel.

## I'm getting tired
If you get bored of typing a command, btw, you can create an alias to it and make it easier. An alias is just a shorhand
way of referring to a command. You'll have seen your instructor doing this in class quite often like this:

```
alias ll='ls -gAGFh'
ll
```{{execute}}

This introduces the alias `ll`. When you issue that command it will be expanded (invisibly) to `ls -gAlFh` by bash. This is
quite useful sometimes, but be careful with it. You can go to far and end up redefining the whole of bash if you're not 
careful. We often use this whenever a command has common typos, so we could do this:

```
alias gti=git
```{{execute}}

Which can be quite handy if you're unable to use your proffesional tools proficiently ;)

Another way to save yourself some effort is to always let bash complete your file and directory names for you by pressing
the `tab` key. Try it now: type `cat .bash<tab>` -- don't type the angled brackets or the word tab, just press the tab key 
(duh!). Always do this, it'll save you hours making typos.

## Subshells
To execute one command as part of antoher you can put the command in backticks or you can invoke a subshell using the $()
syntax. The output of the subshell is given as an argument of the current command. You'll see more of this later, but you 
could do this:

```
wc -l $(ls -A)
```{{execute}}

Which runs `wc -l` on every file in the current directory (`-A` lists all files without the 'special' directories `.` and `..`).

## This is way too long
One last thing then we'll be on our way to the next step. Sometimes (often) our commands don't fit on a single line because
they're just way too long. This happens because we often string commands together with comands like logical-or `||` which
executes the command on the right if the command on the left failed, and logical-and `&&`, which executes the command on 
the right if the command on the left succeeded, or just plain `;` which plain doesn't care what happend to the command on
the left and always executes the command on the right.

```
false || echo "Oops, fail"
```{{execute}}

```
true || echo "Will not be printed"
```{{execute}}
  
```
true && echo "Things went well"
```{{execute}}

```
false && echo "Will not be printed"
```{{execute}}

```
false ; echo "This will always run"
```{{execute}}

We will often string so many commands together that the line is wayyyyyy toooooo bigggggg..........

```
sudo apt update && sudo apt install -y bash curl vim jq && sudo apt autoclean
```{{execute}}

(btw, there is no `sudo` by default in a docker container)

To make this a lot easier to read, we will break the line with a `\` symbol...

```
sudo apt update && \
sudo apt install -y bash curl vim jq && \
sudo apt autoclean
```{{execute}}

That's one line, with a few linebreaks. You'll see a lot of this in dockerfiles as we try to cram a bunch of commands
into a single layer.

### Time to move on
Ok, that was long. We're ready for the next phase of your induction, entitled 'how not to bore your instructor to death'...