# How to use a bash terminal

## Learn how to control bash terminal

In the beginning was the command line...

### History
We're going to start by making you fast at using the command-line by looking into history. To do that there are a few simple commands to learn.

Let's start by issuing a few commands in order to create a history. Don't focus on the commands themselves right now; we'l cover them later. The important thing right now is to make you fast at using the command-line.

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

Ok, now that we have some history, let's look at how to access it. As you've just seen, you can view the history by typing `history`. Notice how the results are numbered. We can recall a line of the history by number, but this isn't terribly useful, as the history may be long and you probably would have been able to correctly retype a command by the time you find it in the history by looking at it. Rather than do that, we typically do a reverse search on the history by typing `ctrl-r `.  Try this now, type `ctrl-r` and then type `echo`. You'll see the echo command comes straight back onto the command line. We can execute this by pressing enter, or we can edit it by using the arrow keys.

The reverse-search searches by the characters you type after you type `ctrl-r`; the more you type the more precise the search will be. If you press `ctrl-r` again then the search will continue to the next result it can find backwards through the command history. If you try this with `cat` as the search string you'll see this in action. You'll first hit the `cat ~/.bashrc`, but if you hit `ctrl-r` again you'll be moved to the `cat ~/sinister-ducks.txt` command. You can execute either by hitting enter.

We can also use the up and down arrow key to navigate from the end of the history backwards in execution order. We typically use the arrow key if the command we are searching for is recent (within, around, the last 5 commands). If its further back than this then we would use the reverse search technique instead.

Get used to this, you are not expected to type the same command twice. It is usually slow and error prone. It is always better to pull a previous command from history.

### Targets
Another way of accessing something you've typed in the past is to recall the arguments of the commands you've previously run. This is an excellent technique when executing multiple commands against the same file or directory. To recall the most recent argument hit `esc-.` (that's escape followed by dot). Try this now by typing:

```
cat <esc-.>
```

I haven't provided a copy or execute for that command beause Katacoda can't easily simulate the `esc-.` key combination, and it wouldn't help you learn it.

### Clear

At certain point we may want to clean your screen. for that we can use 'clear' command. you can 

```
clear
```{{execute}}

---



