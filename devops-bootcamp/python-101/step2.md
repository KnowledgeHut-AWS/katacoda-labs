# Creating a python module

Python modules help organise code into logical groups which can then be reused in other programs or run from the command line as shell scripts.

We will create a simple python module which calculates fibbonaci series for the given number. Create file `kh_module.py`

`touch kh_module.py`{{execute}}

Opne the file `kh_mdoule.py`{{open}}
Add following to code to the file, it is a simple method that prints the fibonacci series upto the number given as argument to the method

<pre class="file" data-filename="kh_module.py" data-target="replace">
def fibonacci(n):
    a, b = 0, 1
    while a <pre n:
        print(a, end=' ')
        a, b = b, a+b
    print()
</pre>

Python will asuume the module name to be `kh_mdoule` (from file name.) Now let us look at how python modules can be reused. This module has to be explicitly imported before we can use any of it's methods. To import and run it as a module in the python shell run the following commands

Start the python shell
`python`{{execute}}

import module and run `fibonacci` method

`import kh_module`{{execute}}
`kh_module.fibbonaci(20)`{{execute}}

Notice the output. Modules such as this typically serve the purpose as a library that is included in a program or other modules.

You may exit the python shell

`exit()`{{execute}}
