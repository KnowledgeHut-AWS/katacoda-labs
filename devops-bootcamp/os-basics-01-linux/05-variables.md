## Environment Variables
Before we go much deeper we must understand environments and variables... A variable is a symbol to which we assign a value. The value 
assigned is always a string, but that string can be used to represent many things. Variable names may only contain letters
(a to z or A to Z), numbers ( 0 to 9) and the underscore character `_`. Convention dictates that variables are all uppercase
but this isn't strictly adhered to. Variables belong to a session, unless we do something to keep them around. To understand
how to do that we first need to know a little about how bash starts up.
 
As you might expect, you can set a variable like this:

```
ABC=wibble
```{{execute}}

And we access it with a `$` (dollar) sign, like this

```
echo $ABC
```{{execute}}

But if you want to do that in a string it's best to wrap the variable name in braces `{}` to keep it clear where the name 
begins and ends, like this:

```
NUM=2
echo "1$NUM3"
```{{execute}}

See, it's a problem! The variable $NUM3 doesn't have a value so nothing is output for it. Solve it like this

```
echo "1${NUM}3"
```{{execute}}

That's about all there is to it really. Variables are incredibly useful though and we'll use them all the time. Oh, and
it's regular practice to put your variables in quotes, like "$NUM", to ensure that if they contain a space they will be 
quoted as a single string, though sometimes you don't want that (and in bash we don't need it as much), so use sparingly.
 
## Bash resource configuration 
To keep them around we usually place them in a script that runs every time we start a shell -- the `.bashrc` file, or one 
of the other scripts it invokes. The bashrc file is just a normal script, but it is used to configure bash itself. When 
bash starts it looks for this script and executes it. Often it will call other files to make your shell awesome. Another related 
file is called `.profile`, but it is a throwback to an earlier, simpler, time when linux was called unix and nobody really 
understood any of this stuff very well. You can effectively ignore `.profile` files and concentrate on `.bashrc`. If you want
a variable to keep its value every time you start a shell or terminal, put its definition in `.bashrc`.

