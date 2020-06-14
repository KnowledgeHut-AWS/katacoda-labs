# Bash Loops

## Bash Loops

In case we want to take a backup of multiple people then it becomes very difficult to run the backup script again and again.
To solve this problem, Bash gives looping concept. We can run certain activities as per our condition.

There are mainly three loops 

For Loop

While Loop

Untill Loop

### For Loop

For loop is used to iterate through any given code for any number of supplied items in the list.


`vi forloopdemo.sh`{{execute}}

press 'i'


`#!/bin/bash`{{execute}}

`for i in a b c d ; do`{{execute}}

`    echo $i`

`done`{{execute}}


There are frou reseve words in foor loop for, in, do, done. 

For each item  in list a, b, c, and d assign each item into a variable i. Once assigned then do echo $1. This will print hte variable.


### While Loop

The next loop is While loop. While loop runs only when this conditions holds true. Once specified condition becomes false then loop execution will stop.

`vi whileloopdemo.sh`{{execute}}

press 'i'

`#!/bin/bash`{{execute}}
  
`counter=0`{{execute}}

`while [ $counter -lt 10 ]; do`{{execute}}

`    let counter+=2`{{execute}}

`    echo $counter`{{execute}}

`done`{{execute}}

In this loop, we have intialized a counter  and we want to print only even number so it start counter value with zero and with every run it increments the counter with value 2. Untile $counter values becomes greater than 10 , it will keep on printing the even numbers.

so output is 2, 4, 6, 8, 10

Once conditions becomes fales loop execution stops.

### Untill Loop


Next loop is Untill loop. This loop acts like whileloop but it code is executed only when condition remains false. The momemnt condition becomes true loop stops excuting.

Here is the example.

`vi untilloopdemo.sh`{{execute}}

press 'i'


`#!/bin/bash`{{execute}}
  
`counter=20`{{execute}}

`until [ $counter -lt 12 ]; do`{{execute}}

`    let counter-=2`{{execute}}

`    echo $counter`{{execute}}

`done`{{execute}}

In this case our counter started with 20. It checks whether $Counter value is less than 12, if this condition is false then loop will execute, so it goes inside loop then reduce the counter by 2 and print the value. So first value we can expect is 18 then 16, 14, 12 and 10.

Now why do we have 10 here? 

Because when our counter value became 12,condition was still false so it entered the loop then reduced the counter by 2 i.e. 12 -2 = 10 and printed this value.

Idea is once condition will remain false, loop will do whatever is specified in this loop.


