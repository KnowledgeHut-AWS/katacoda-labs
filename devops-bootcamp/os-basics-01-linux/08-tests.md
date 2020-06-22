## Tests as in `if` statements, not as in testing your code

This section has been broken out of the main scripting module because it's too long and isn't specifically related to scripting.
Instead, it talks about the 'test' part of the `if` statement using a ternary operator syntax to demonstrate how to test
for various things that you need to know how to test for.

## The rule of 3's is real magic

You don't always need to include the `if` statement when doing a comparison. There is a bash equivalent of the ternary operator 
(`?`) which is so beloved of C-programmers and their bastard children. It goes like this:

```
[[ "string1" == "string1" ]] && echo "Equal" || echo "Not equal"
```{{execute}}

And

```
[[ "string1" == "string2" ]] && echo "Equal" || echo "Not equal"
```{{execute}}

If you're not sure what a ternary operator is then you should google it because this isn't the right place to be explaining
cool programming concepts to people who should already know them. You might have been told that ternaries are bad -- this
is the opinion of uncool people who can neither program nor tie their shoe-laces and you should learn to ignore people like
that beause they'll lead you astray. Stay pure, use ternaries -- they're part of the language and you should either be proficient
in the langauge you're using or you should go home.

> Notice that the equals comparitor is `==`. Don't believe anyone who tells you that it should be `=` -- that's for assigning
> a value to a variable, unless testing with `[]` which you shouldh't do because it's old-fashioned 

## Let's go cook up a file (common recipies for testing files)

These 'recipies' use the ternary syntax to demonstrate the syntax for identifying files and comparing strings in 'tests'. 
You can use the given test-commands in `if` statements or any other form of test, you're not limited to using them in ternaries.

### Test if a file exists
```
[[ -f ex1.sh ]] && echo "exists" || echo "doesn't exist"
```{{execute}}

### Test if a file is missing
```
[[ ! -f missing.sh ]] && echo "missing" || echo "found it"
```{{execute}}

### Test if a directory exists
```
[[ -d ~/git ]] && echo "exists" || echo "doesn't exist"
```{{execute}}

### Test if multiple files exist
```
[[ -f ex8.sh && -f ex7.sh ]] && echo "Both files exist." || echo "At least one file is missing"
```{{execute}}

### Test if either file exists
```
[[ -f ex8.sh || -f ex7.sh ]] && echo "Both files exist." || echo "Both files are missing"
```{{execute}}

### Test if a name exists on the filesystem regardless of its type (directory, socket, named pipe, etc.)
```
[[ -e ex1.sh ]] && echo "exists" || echo "doesn't exist"
```{{execute}}

### Test if a non-empty file exists
```
[[ -s ex8.sh ]] && echo "found non empty file" || echo "didn't find a file or found an empty file"
```{{execute}}

### Test if a file exists
```
[[ -w ex8.sh ]] && echo "writable file exists" || echo "can't find a writable file of that name"
```{{execute}}

### Test if a file exists
```
[[ -x ex8.sh ]] && echo "found an executable file" || echo "can't find an executable file of that name"
```{{execute}}


## Don't judge me
Regular expressions are cool. They are also confusing and difficult, which is why bash has built in the capability to use
them in tests -- remember, bash is confusing and difficult, keep telling yourself that and you'll understand why this is
so hard (hint: it's because it's hard). That should make you feel better about yourself, but it won't help you learn. Now:

```
[[ "Under my umbrella" =~ .*ella.* ]] && echo "ella ella eh eh eh" || echo "I don't like Rihanna (yes, there's something wrong with me)"
```{{execute}}

You can use any regular expression here and it will just work. It looks a little odd, not wrapping it in a string, but hey-ho.
Again, we're not going to study regular expressions on this course directly, but you are expected to know them so go checkout
a reference online and learn about them. They are very cool and nothing to be afraid of.

## I feel so empty inside
To check if a string is empty you can use the '-z' command

```
[[ -z '' ]] && echo "in the cold vastness of space" || echo "I don't know what's happening"
```{{execute}}

