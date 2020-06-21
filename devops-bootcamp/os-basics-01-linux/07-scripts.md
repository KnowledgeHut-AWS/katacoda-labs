## What's a script?

A script is a list of commands in a text file that can be executed in the order encountered. It can take arguments, can
call other bash tools, and may contain functions. Bash scripts are pretty sophisticated and have plenty of 'built-in' capabilities.

Let's start this by creating a hello world script...

```
mkdir -p ~/git/$USER/linux-101-scripts
cd ~/git/$USER/linux-101-scripts
echo '#!/bin/bash' > my-first-script.sh
echo "echo 'hello world'" >> my-first-script.sh
chmod a+x my-first-script.sh
cat my-first-script.sh
./my-first-script.sh
```{{execute}}



