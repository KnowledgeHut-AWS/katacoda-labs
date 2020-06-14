# Relative vs Absolute Path
## Relative vs Absolute path

An absolute path is defined as specifying the location of a file or directory from the root directory(/). In other words,we can say that an absolute path is a complete path from start of actual file system from / directory.


Relative path is defined as the path related to the present working directly(pwd). It starts at your current directory and never starts with a / .


.(a single dot) - this represents the current directory.

..(two dots) - this represents the parent directory. 


Let's discuss what is relative and absolute path in more simple language. In order to understand this, we need to take a analogy. Imagine Linux file system as a multistory building. Enterance of the building is called root and represented as /. To navigate to room 1 on level 5, we need to first go to main enterance (/) then we need to go to 5th floor floor5 floor5/ and from there enter the room1. Hence the absolute path to this particular room within a building is /floor5/room1. From here, now we want to move to room 2 then we need to first move out of our room1 by entering ../ and then include room name room2. We took a relative path to room 2 in this case, it is ../room2. As we are already on floor 5, we do not need to leave the building. with respect to main enterance, we have /floor5/room2 that is absolute path.

Absolute path  - /floor5/room2
Relative path  - ../room2 ( I am on 5th floor).

If you want to know your current working directory then run this command

`pwd`{{execute}}

if you want to change your location then you can use cd command.



