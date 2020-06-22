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
desirable. If your script is on the path for example then you may want to forgo the `.sh` suffix to make it less typing
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
in 'long' format so that you can see its flags. Then run it. Easy peasy.

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
script exits, unless it 'exports' them (lit. `export VAR=value` will propagate a variable up to its parent shell). 

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

The `{1..10}` bit is called a 'range'. It generates numbers from 1 to 10 (pretty obvious, huh?). This isn't that useful though, because we don't often do this sort of
thing in automation work. Often, we iterate over files instead (or other things). 

> Notice that I've put the `do` on a separate line this time. There is no need to do this, I just wanted to show you that you 
> can. I prefer not wasting a line, so we'll use the `for ... ; do` format from now on.

> Also notice that I have quoted the first "EOF" this time. This forces the shell to output variables without expanding it.
> All that means is that the `$i` is written to the file as the string "$i" rather than being expanded. As that variable
> currently has no value it would be expanded to an empty string, which changes the `echo` line to output nothing but a newline.

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

This will find all the script files in the current directory (if you've been following along, then there are five of them),
and lets you know about each one it finds. Now, this is quite useful, but there are other ways to achieve the same thing
that I'll leave as an exercise for you to find online. (I mean it, find 2 other ways of doing the same thing in bash).

You can use `break` and `continue` in a loop, just like in most programming languages. I won't go into depth about them 
because I suspect you've all used these loop constructs before. To jump out of a loop you use `break` and to iterate early
you use `continue`. Also, there are other loop types: `until` and `while` -- we will see examples of a `while` loop late
on in this chapter so there's no point in going on about them here.

All loops in bash iterate over a space delimited list of arguments. You can create that list using ranges, or use files 
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

The array dereferencing syntax is needed to turn the array into a list. Lists are space delimited, but arrays are different
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
But, as with most things in bash, it's not quite that simple... 

Let's start with the TEST-n bit. There are two test-commands in bash `[]` and `[[]]`. The second is preferable because it
allows the use of common string comparison operators and automatically deals with variables with spaces in them. Let's just
take a quick look at that:

```
cat << "EOF" > ex8.sh
#!/bin/bash
X="This is X"
Y="This is Y"

# Syntax-A
if [ "$X" != "$Y" ]; then
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

> Note that the `!=` operator would be changed to `-ne` if the vars were numbers rather than strings. The other comparisons
> should be obvious: `-eq | ==`, `-lt | <`, `-gt | gt`, `-ge | >=`, `-le | <=`, etc. 

These two example `if` statements are equivalent. In **Syntax-A** we need to wrap the vars in quotes to allow bash to see 
them as a single value, otherwise the space will confuse things. This is all a bit awkward and difficult to write and 
to read. 

However, with **Syntax-B** we are able to just use the variables without wrapping them in strings. This is a shorter and
clearer, making it easier to write, more maintainable, and less likely to be wrong. In modern bash, we always use **Syntax-B**,
so this is the one you should focus on. You will see lots of people writing **Syntax-A** though -- this is mostly because
they have had no formal training and have picked up a lot of bad habits. You do not have this excuse, so if I ever catch
you doing the wrong thing you'll be severly punished to the full extent of the law. Also, people often use the 'old' syntax
because they want their bash scripts to be compatible with other shells that don't support the modern syntax. There is absolutely
no need to do this. Bash is ubiquitous and only hipsters and non-professionals use other shells. If in doubt, install bash,
then you'll be ok to use bash syntax. Bash is so popular that a lot of other shells have adopted this this and other bash
syntax too, so you'll probably be ok. Unless you're on a Mac, then nothing you do will ever be right.

## The case is closed
Sometimes you have too many `elif` clauses and you want a more elegant and readable structure. Enter the `case` statement.

```
cat << "EOF" > ex9.sh
#!/bin/bash
OS="Alpine"

case $OS in

  Alpine)
    echo "Alpine -- best"
    ;;
    
  Debian | Ubuntu)
    echo "Debian OS - acceptable"
    ;;

  Fedora | CentOS | RHEL)
    echo "Fedora OS - run away"
    ;;
esac
EOF
chmod a+x ex9.sh
./ex9.sh
```{{execute}}

To be fair, I'm not sure that's actually more readable, but there are lots of examples I found on the web that demonstrate
the power of this technique better than I can do here, and I didn't want to just rip them off so 
[Check out the link here](https://www.thegeekstuff.com/2010/07/bash-case-statement/).

## Don't argue with me
You can pass arguments (parameters) to a script but dealing with them inside the script can be hard and confusing. That 
probably doesn't shock you any more, so let's dive right in with the basic rules of arguments/parameters (both terms are
common, but I think 'parameter' is formally correct, though sometimes we call the same thing 'switches' or 'flags').

## Positional Parameters
We use the `$` (dollar) sign and a number to designate a parameter. The first parameter, `$0` is the name of the script
being run, so `$1` is the first parameter. Here's a quick example:

```
cat << "EOF" > ex10.sh
#!/bin/bash
echo "Script name is: $0"
[[ ! -z $1 ]] && echo "First parameter: $1" || echo "give me some sugar"
[[ ! -z $2 ]] && echo "Second parameter: $2" || echo "give me more sugar"
EOF
chmod a+x ex10.sh
./ex10.sh
./ex10.sh wibble
./ex10.sh wibble wobble
```{{execute}}

Typically in linux scripts though, arguments are not positional because you can place them in any order. To do that we
could address the parameters in turn in a loop and pass them through a case statement that checks for short form (often 
called flags) and long form, multi-letter, parameters.

```
cat << "EOF" > ex11.sh
#!/bin/bash
for p in $@; do
  case $p in
    -a | --alpha) echo "processing param a: $p" ;;
    -b | --beta) echo "processing param b: $p" ;;
    -d | --delta) echo "processing param d: $p" ;;
  esac
done

echo "I found $# parameters"
EOF
chmod a+x ex11.sh
./ex11.sh --delta -a --beta 
```{{execute}}

Notice the `$@` that I snook in there? That means 'all' parameters from 1 upwards. Another thing I snook in at the bottom
is the `$#` symbol that expands to the count of the parameters (it doesn't count $0 though).

> Of course, this doesn't separate out the params if they're all passed together, like `./ex11.sh -cab` as we're used to. If
> you detected that you could 'normalise' the parameters into separate parameters.

> Also, pay attention to this form of the case statement -- it is using a 'logical-or' statement to put two values per line
> and those values are not wrapped in strings. Bash knows that they're strings because the argument `$p` is a string.

Another way to write the same thing is to use the `shift` operator, which pushes all the parameters (above 0) one place
to the left. Using that, the script becomes a little longer, but it is useful if you're not sure how many params to expect:

```
cat << "EOF" > ex12.sh
#!/bin/bash
echo "$# params to start with"

while [[ ! -z $1 ]]; do
  case $1 in
    -a | --alpha) echo "processing param a: $1" ;;
    -b | --beta) echo "processing param b: $1" ;;
    -d | --delta) echo "processing param d: $1" ;;
  esac
  shift
done

echo "$# params left unprocessed"
EOF
chmod a+x ex12.sh
./ex12.sh --alpha -d --beta
```{{execute}}

The shift allows me to always deal with the first parameter. If I wanted a param to take a value I could deal with this
in exactly the same way without having to work out what the index of the param and associated value is, which is very complex
given that params could occur in any order.

```
cat << "EOF" > ex13.sh
#!/bin/bash
echo "$# params to start with"

while [[ ! -z $1 ]]; do
  case $1 in
    -a | --alpha) echo "processing param a: $1 as $2" && shift ;;
    -b | --beta) echo "processing param b: $1" ;;
    -d | --delta) echo "processing param d: $1" ;;
  esac
  shift
done

echo "$# params left unprocessed"
EOF
chmod a+x ex13.sh
./ex13.sh --alpha wobble -d --beta
```{{execute}}

The loop and case statements, with shift, add up to a pretty easy way to handle arguments to your scripts. As a bonus, it
is possible to use exactly the same technique to deal with arguments to a function too.

## GetOpt(s)
There are two other common ways of dealing with arguments to your scripts. `GetOpt` and `GetOpts`. The first one, `getopt`
is a GNU library that parses arguments and works with short (single dash with a single letter) and long forms (double dash 
and words). `getopts` is a bash builtin (a function that is part of bash) that also parses arguments, but which only supports 
short forms.

```
cat << "EOF" > ex14.sh
#!/bin/bash
#!/bin/bash
echo "$# params to start with"

while getopts “abd” opt; do
  case $opt in
      a) echo "a" ;;
      b) echo "b" ;;
      d) echo "d" ;;
  esac
done
EOF
chmod a+x ex14.sh
./ex14.sh
```{{execute}}

Ultimately, there are lots of ways of parsing arguments in bash. We've only really scratched the surface here. If you're 
doing something quick and easy, you might want to use `getopts`, and I strongly encourage you to read a full document on 
that tool (`getopt` is also useful, though rather under-powered for modern scripts). If you're doing something complicated,
then maybe writing your own following the method in `ex12.sh` is a common approach (after all, it's not very difficult).
But, if performance is an issue (which it would be if you needed to execute this script thousands, or hundreds of thousands,
of times a day (it does happen), then you'd stick with the builtin `getopt` because it'll work faster because it doesn't
need any external libraries.

## I'm barely functional at this point, can we take a break?
No, we're going to discuss **functions** instead, because they're the final part of the scripting conundrum that you need to
master before you go eat, drink coffee, or smoke Shisha. Come on, one more push and you're done.

```
cat << "EOF" > ex15.sh
#!/bin/bash
function hello {
  echo -n "Hello "
}
function world {
  echo "world!"
}
hello
world
EOF
chmod a+x ex15.sh
./ex15.sh
```{{execute}}

So, that doesn't seem difficult. You can put any code you want in a script, call it in any order you want, and everything
is good. It's quite a simple concept for anyone who has seen a programming language before. 

Unfortunately, this is bash, which means that things that appear simple on the surface are actually lulling you into a false
sense of security. Watch out, here be dragons (again)...

```
cat << "EOF" > ex16.sh
#!/bin/bash
function dump {
  printf '%s' "$1" 
}
dump "hello "
dump "world!"
echo
EOF
chmod a+x ex16.sh
./ex16.sh
```{{execute}}

I've used the `$1` positional argument here, and I've used `printf` for the first time. `printf` is preferable to `echo` 
in most cases. It takes a print format: `%s` in this case means that it is going to print a string -- not a very complicated
pattern I know, but echo will strip the trailing space from the "hello " string and therefore the output will be "helloworld",
rather than "hello world". The final echo is there just to print a newline.

## Not boring, honestly
The interesting thing with functions is that they are global. This can be problematic, but you shouldn't be doing too much
complex stuff with bash so it shouldn't be a big issue. So, why is this interesting? Because you can create functions in
your shell that acts just like other commands. Try this

```
cat << "EOF" > ex17.sh
#!/bin/bash
function wibble {
    printf '%s %d' $1 $2
}
EOF
chmod a+x ex17.sh
. ex17.sh
```{{execute}}

Notice that we have 'sourced' this file. We discuss what that means at the top of this file. It's the `.` at the start
of the script invocation that is the source command (and I've used the `.` form because I'm lazy -- the full form is the 
word `source`).

Now you have a global function in your session called `wibble` that takes a string followed by a number as a parameter.
You can invoke it like this:

```
wibble Super 10
```{{execute}}

Functions are a really useful way of introducing custom commands into the system and for breaking up your code into manageable
chunks. And remember, because this is bash, when you invoke a function if you don't need to wait for it to return you can
append a `&` on the end of the call in order to run the function in the background, in parallel with everything else you're
doing. This can be devastating if you do it wrong, but liberating otherwise (as long as the functions/tasks you're starting
really are independent). 

## We're done, get me out of here
Finally, you can exit a script at any point using the `exit` command. This takes a single parameter, a number. If you return
0 then the script exits without an error status, but if you give a different number then it exists abnormally (abend). If 
you don't give a number, then the script exits with the return code of the most recent command. To access the return value 
(status) of a command, use the `$?` variable.

```
cat << "EOF" > ex18.sh
#!/bin/bash
exit 11
EOF
chmod a+x ex18.sh
./ex18.sh
echo $?
```{{execute}} 

