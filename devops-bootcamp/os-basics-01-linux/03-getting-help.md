# Getting Help
## Or, how not to bore your instructor to death with dumb questions...

A nice short one this time. There are many options with almost all commands. You do not need to remember all of these 
options. You can refer to the manual using the `man` command. For example:

```
man echo
```{{execute}}

Also, most built-in commands can also be executed with `--help` as an argument to display a short help string, or sometimes 
the whole manual. It really is up to the command in question.

```
echo --help
```{{execute}}

Man entries have sections, which you can jump to. You can also search by typing a `/` charater and typing the thing you're
searching for. To be all inception like and self-referential, try typing `man man`{{execute}}. To exit the manual, or the
help within the manual, just type `q` for 'quit'.

You can also look things up online, but be careful there because most people aren't trained in the correct approaches to bash
and there is a lot of nonsense on the web. Your first option should always be the online help, then try a useful source
like stackoverflow or server-fault (which are related sites).
