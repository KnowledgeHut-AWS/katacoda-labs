## What's a script?

## Prerequisites
Let's get the lab ready on your machine...

```
mkdir -p ~/git/$USER/labs/scripting/
cd ~/git/$USER/labs/scripting
```{{execute}}

A script is a list of commands in a text file that can be executed in the order encountered. It can take arguments, can
call other bash tools, and may contain functions. Bash scripts are pretty sophisticated and have plenty of 'built-in' capabilities.

Let's start this by creating a hello world script...

```
echo '#!/bin/bash' > my-first-script.sh
echo "echo 'hello world'" >> my-first-script.sh
chmod a+x my-first-script.sh
cat my-first-script.sh
./my-first-script.sh
```{{execute}}

This creates a 2-line script (using echo to populate it). It modifies permissions on this script to be executable to everybody, 
then dumps its contents to stdout (which, you will remember, is bound to your terminal at the moment) so that you can read
it. Then, it executes the script. Simple!

**Note**: it is only a convention to name one's scripts ending with a `.sh` suffix. This isn't necessary and often isn't 
desireable. If your script is on the path for example then you may want to forgoe the `.sh` suffix to make it less typing
to invoke it and to make it look like a 'normal' command.

## Hashbang
The script starts with a 'hashbang' statement. This is the #! line that tells bash what tool to use to interpret the script.
You can do this with just about any scripting language, including javascript and python. Without it, you can still execute
the script, but you have to be more specific about which tool to use to run it. The lack of this is why you keep typing
`python <script-name>`. If you'd simply put `#!/usr/bin/python` on the first line of your python files and made them executable,
then you'd have been able to just run them like this `./my-python-file.py`.

## Here be dragons!

A typical way of introducing scripts in dockerfiles (or tutorials) is to use 'heredoc' blocks. Here's an example:

```
cat << EOF > ex1.sh
#!/bin/bash
echo 'hello again'
EOF
```{{execute}}

The file is, of course, up to you. Less obvious is that the EOF marker is also up to you -- it could be any word -- but
in normal use we usually use 'EOF' (it has no special meaning). This uses redirection and magic to create the file -- in 
this case, ex1.sh (example 1.sh -- this is the first example using this naming convention, the rest of the examples will
adhere to this naming patter). We can check it out if you'd like? 

```
cat ex1.sh
```{{execute}}

And, if you'd like, you can run it:

```
chmod +x ex1.sh
ll -l ex1.sh
./ex1.sh
```{{execute}}

The first line of that block makes the script executable, but only for you, and to demonstrate that it has listed the file
in 'long' format so that you can see its flags. Then runs it. Easy peasy.

## I'm running away with myself
When you type a command, bash searches the path (`echo $PATH`{{execute}}) to find an executable. It'll execute the first
thing it finds with the name of the command you have given. For example, when you type `ls` bash will search through the 
directories in the $PATH variable, in order, until it finds `ls` in the `/bin` directory. You can find out where it has 
found `ls` using the `which ls`{{execute}} command (or any other command, obviously).

The `./` at the start of a script invocation is setting the start of the search path to the current directory, because
we rarely have the current directory on the path. Another way to do this is to add the directory with the script to the path
like this (don't do this):

```
PATH=$PATH:~/git/$USER/labs/scripting
```

But I don't actually want you to do that, which is why there is no execute button... I don't want you to, because it will 
mess up your path for the rest of this tutorial, not because there's anything inherently wrong with the idea.

Running a script creates a new shell (a sub-shell) to run it in. If it creates any variables they will be lost when the 
script exits, unless it 'exports' them (lit. `export VAR=value` will propogate a variable up to its parent shell). 

You can also 'source' the script which runs it in the current shell session. For example, we would do this:

```
source ex1.sh
```{{execute}}

To run our script in our current session. Alternatively, you can use a `.` (dot) in place of `source`

```
. ex1.sh
```{{execute}}

## You're sending me round the loop
Bash scripts support loops, which is of course really useful. The basic syntax of a for statement is this:

```
cat << "EOF" > ex2.sh
#!/bin/bash
for i in 1 2 3 4 5 6 7 8 9; do
    echo $i
done
EOF
chmod +x ex2.sh
./ex2.sh
```{{execute}}

Of course, in bash, nothing remains simple for long. We can use a 'range' to do this so much easier:

```
cat << "EOF" > ex3.sh
#!/bin/bash
for i in {1..10}
do
    echo $i
done
EOF
chmod +x ex3.sh
./ex3.sh
```{{execute}}

Notice that I've put the `do` on a separate line this time. There is no need to do this, I just wanted to show you that you 
can. I prefer not wasting a line, so we'l luse the `for ... ; do` format from now on.

The `{1..10}` bit is called a 'range'. It generates numbers from 1 to 10 (pretty obvious, huh?). This isn't that useful though, because we don't often do this sort of
thing in automation work. Often, we iterate over files instead (or other things). 

```
cat << "EOF" > ex4.sh
#!/bin/bash
for f in *.sh; do
    echo "Found script file: $f"
done
EOF
chmod a+x ex4.sh
./ex4.sh
```{{execute}}


This will find all the script files in the current directory (if you've been following along, then there are two of them),
and lets you know about each one it finds. Now, this is quite useful, but there are other ways to achieve the same thing
that I'll leave as an exercise for you to find online. (I mean it, find 2 other ways of doing the same thing in bash).

You can use `break` and `continue` in a loop, just like in most programming languages. I won't go into depth about them 
because I suspect you've all used these loop constructs before. To jump out of a loop you use `break` and to iterate early
you use `continue`. Also, there are other loop types: `until` and `while`, but `for` is the most common so learn that and
just remember the others exist just in case you ever need to read someone else's code.

All loops in bash iterate over a space delimeted list of arguments. You can create that list using ranges, or use files 
like in the example above. You can also use the `xargs` command to 'marshall' the results of a subshell `$()` into a list
suitable for iterating over.

Looping over arrays is interesting too, because of the weird syntax you have to use. Take this example:

```
cat << "EOF" > ex5.sh
#!/bin/bash
BOOKS=('In Search of Lost Time' 'Don Quixote' 'Ulysses' 'The Great Gatsby')

for book in "${BOOKS[@]}"; do
  echo "Book: $book"
done
EOF
chmod a+x ex5.sh
./ex5.sh
```{{execute}}

If you simply try to iterate over `$BOOKS` you'll get a completely different result


```
cat << "EOF" > ex6.sh
#!/bin/bash
BOOKS=('In Search of Lost Time' 'Don Quixote' 'Ulysses' 'The Great Gatsby')

for book in $BOOKS; do
  echo "Book: $book"
done

EOF
chmod a+x ex6.sh
./ex6.sh
```{{execute}}

The array dereferencing syntax is needed to turn the array into a list. Lists are space delimeted, but arrays are different
to a list and can't be treated as one. You won't have to deal with arrays very often, but it's worth noting this as sometimes
they're useful.

It's also worth noting that there is another version of the `for` loop that follows the `C` syntax. It looks like this:

```
cat << "EOF" > ex7.sh
#!/bin/bash
for ((i = 0 ; i <= 10 ; i++)); do
  echo "Counter: $i"
done
EOF
chmod a+x ex7.sh
./ex7.sh
```{{execute}}

You won't see that very often but if you do you'll now be able to understand it. I don't want you using it as it is considered
rare and confusing to most people.

## What if...
The basic structure of an `if` statement is:

```bash
if TEST-1; then
    DO THIS IF TEST-1 IS TRUE
elif TEST-2; then
  DO THIS IF TEST-1 IS FALSE AND TEST-2 IS TRUE
else
  DO THIS IF ALL TESTS ARE FALSE
fi
```
But as with most things in bash, it's not quite that simple... 

Let's start with the TEST-n bit. There are two test-commands in bash `[]` and `[[]]`. The second is preferable because it
allows the use of common string comparison operators and automatically deals with variables with spaces in them. Let's just
take a quick look at that:

```
cat << "EOF" > ex8.sh
#!/bin/bash
X="This is X"
Y="This is Y"

# Syntax-A
if ["$X" -ne "$Y"]; then
    echo "wibble 1"
fi

# Syntax-B
if [[ $X != $Y ]]; then
    echo "wibble 2"
fi
EOF
chmod a+x ex8.sh
./ex8.sh
```{{execute}}

These two tests are equivalent. In Syntax-A we need to wrap the vars in quotes to allow bash to see them as a single
value, otherwise the space will confusing things, and we need to use the comparitor function `-ne` (not equals) to compare
the strings. This is all a bit awkward and difficult to write and to read.

However, with Syntax-B we are able to just use the variables without wrapping them in strings and we can just use the same
string comparitor, `!=`, that we are familiar with from other programming languages. This is a shorter and clearer, making 
it easier to write, more maintainable, and less likely to be wrong. In modern bash, we always use Syntax-B.
