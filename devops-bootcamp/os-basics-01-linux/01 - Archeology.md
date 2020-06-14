# Archeology 
## How not to repeat yourself repeat yourself repeat yourself in Linux
### In the beginning was the command line...

### History
We're going to start by making you fast at using the command-line by looking into history. To do that there are a few 
simple commands to learn.

Let's start by issuing a few commands in order to create a history. Don't focus on the commands themselves right now, 
we'll cover them later. The important thing right now is to make you fast at using the command-line.

First type (or execute) this:

```
echo "March of the sinister ducks" > ~/sinister-ducks.txt
```{{execute}}

Now try this:

```
cat ~/sinister-ducks.txt
```{{execute}}

And

```
ls -gAlFh ~
```{{execute}}

And another cat...

```
cat ~/.bashrc
```{{execute}}


Ok, now that we have some history, let's examine it:

```
history
```{{execute}}

Now that we have some history we will look at how to access it. As you've just seen, you can view the history by typing
 `history`. Notice how the results are numbered. We can recall a line of the history by number, using this syntax:

```
!2
```{{execute}}

We can use the exclamation command and name a line (by number) to recall the associated command and execute it. But this 
isn't terribly useful, as the history may be long and you probably would have been able to correctly retype a command by
the time you find it in the history by looking at it. You can pipe the history to grep though (we'll cover grep in detail later,
but basically, it searches it's input for a match to a regular expression or a string). You might use it like this:

```
history | grep cat
```{{execute}}

You can use the ! with the prefix of a command to recall that line too. You would use ```!cat```{{execute}} to search back
to the previous `cat` command, but there's an easier way to do that: 'Reverse Search'. We usually do a reverse search on 
the history by typing `ctrl-r` and the stem of the thing we're searching for.  Try this now, type `ctrl-r` and then 
type `echo`. You'll see the echo command comes straight back onto the command line. We can execute this by pressing enter 
or we can edit it by using the arrow keys.

The reverse-search searches by the characters you type after you type `ctrl-r`; the more you type the more precise the 
search will be. If you press `ctrl-r` again then the search will continue to the next result it can continue backwards through 
the command history. If you try this with `cat` as the search string you'll see this in action. You'll first hit the 
`cat ~/.bashrc`, but if you hit `ctrl-r` again you'll be moved to the `cat ~/sinister-ducks.txt` command. You can execute 
either by hitting enter.

We can also use the up and down arrow key to navigate from the end of the history backwards in execution order. We typically 
use the arrow key if the command we are searching for is recent (within, around, the last 5 commands). If its further back 
than this then we would use the reverse search technique instead.

Get used to this, you are not expected to type the same command twice. It is usually slow and error prone. It is always 
better to pull a previous command from history.

Be aware, when typing commands, if you put a space or tab before the command it is not added to the history. This is a 
security feature so that you can add credentials to commands and not have them recorded in the history (which is readable
by the root user). Putting these commands in the history 'discloses' your credentials to the admins, and that's not often
considered a good idea, which is why there had to be a mechanism to defend you from this, hence the fact that no command
starting with whitespace is entered into history. Be aware of this however, because if you regularly make use of history
(and we all do) and you're pasting into the terminal from the web, ensure that you don't copy whitespace too otherwise
you'll not end up with the history you need.

### Targets
Another way of accessing something you've typed in the past is to recall the arguments of the commands you've previously 
run. This is an excellent technique when executing multiple commands against the same file or directory. To recall the 
most recent argument hit `esc-.` (that's escape followed by dot). Try this now by typing:

```
cat <esc-.>
```

I haven't provided a copy or execute for that command beause Katacoda can't easily simulate the `esc-.` key combination, 
and it wouldn't help you learn it. You'll just have to type it, sorry.

The more you press it, the further it searches back through the history for command targets (parameters) to replicate.

### Clear

At certain point we may want to clean your screen. for that we can use 'clear' command. you can 

```
clear
```{{execute}}

or you can type ctrl-l (which is easier and quicker; and won't get you shouted at by the instructor for wasting time).

To stop a running command you can usually type `ctrl-c`. Because this is 'paste' in most systems (including linux) the 
paste is often remapped to either `shift-ins` (insert), or `ctrl-shift-v` (which I prefer). If you are on a macbook with 
linux installed you're still going to have problems. You won't buy one of them again will you? Let's try ending a process
now. The process we'll try with is ```top```{{execute}} (it views system resources). It runs forever, so when you get bored
of looking at all the wonderful data it displays, kill it by typing `ctrl-c`.

To exit a terminal (or other command with a prompt) you should type `ctrl-d`, which is the same as typing `exit`. If you 
want to try this, first let's start another shell inside this one. Type ```bash```{{execute}} (yes, it's that easy) to start
another bash shell. You can check this out with ```ls -gAlFh```{{execute}} which should show you a formatted list of 
the contents of your home directory. If you want to exit that command prompt, kill that shell session, and return to its 
parent, you can type ```exit```{{execute}}. If you do that, open another session (```bash```{{execute}}), do something
again -- ```cat ~/.bashrc```{{execute}}, then exit the session with `ctrl-d`. If you're vigilent, you'll notice the word
`exit` flashing up at the bottom of the terminal as you exit. `ctrl-d` just inserts the word exit.

