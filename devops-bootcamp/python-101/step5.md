# Building Python Module

Make a directory `my_example_project`

`mkdir my_example_project`{{execute}}
`cd my_example_project`{{execute}}

Create the `setup.py` file,

`touch setup.py`{{execute}}

Add following code to the setup file

<pre class="file" data-filename="setup.py" data-target="replace">
import setuptools

with open("README.md", "r") as fh:
    long_description = fh.read()

setuptools.setup(
    name="example-pkg-kh-anadi", # Replace with your own module name
    version="0.0.1",
    author="Anadi Misra", # Replace with your name, unless you wanna make me famous :-)
    author_email="anadi@knwoledgehut.co", # Replace with your email, or spam expose Bryan :-P
    description="A small example package",
    long_description=long_description,
    long_description_content_type="text/markdown",
    url="https://github.com/knowledgehut-aws/python-101",
    packages=setuptools.find_packages(),
    classifiers=[
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: MIT License",
        "Operating System :: OS Independent",
    ],
    python_requires='>=3.6',
)
</pre>

Add simple `README.md` file

`touch README.md`{{execute}}

Add following makrdown code to this file

<pre class="file" data-filename="README.md" data-target="replace">
# Example Package

This is a simple example package. You can use [Github-flavored Markdown](https://guides.github.com/features mastering-markdown/) to write your content.
</pre>

Add a license file

`touch LICENSE`{{execute}}

<pre class="file" data-filename="LICENSE" data-target="replace">
Copyright (c) 2020 The Python Packaging Authority Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions: The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
</pre>

Create a package folder `example_pkg_kh`

`mkdir example_pkg_kh`{{execute}}

Add tests source folder

`mkdir tests`{{execute}}

Change to the Test directory and add a unit test

`cd tests`{{execute}}

Add the following unit tests

<pre class="file" data-filename="test_calculator.py" data-target="replace">
import unittest
from example_pkg_kh.calculator import Calculator
class TestCalculator(unittest.TestCase):
    def test_returns_0_for_empty_arguments(self):
        calc = Calculator()
        self.assertEqual(0, calc.sum())
    def test_returns_sum(self):
        calc = Calculator()
        self.assertEqual(3, calc.sum(1, 2))
</pre>

We need to add an `__init__.py` file to this directory

touch `__init__.py`{{execute}}

***Note***: The `__init__.py` files are required to make Python treat the directories as containing packages; this is done to prevent directories with a common name, such as string, from unintentionally hiding valid modules that occur later on the module search path.

Go to the `example_pkg` directory and add `calculator.py` file as follows

`cd ..`{{execute}}

`cd example_pkg_kh`{{execute}}

`touch calculator.py`{{execute}}

<pre class="file" data-filename="calculator.py" data-target="replace">
class Calculator:
    def sum(self, a = 0, b = 0):
        return (a + b)
</pre>

We also need to create the `__init__.py` file

`touch __init__.py`{{execute}}

The final directory strcuture would look like this

```bash
my_python_project
├── README.md
├── example_pkg_kh
│   ├── __init__.py
│   └── calculator.py
├── setup.py
└── tests
    ├── __init__.py
    └── test_calculator.py
```

Run the unit tests from `my_example_project` directory

`cd ..`{{execute}}

`python -m unittest discover -v`{{execute}}

Our code is now ready to be released as a package

Install or updgrade the following modules for running python module build

`python -m pip install --upgrade pip setuptools wheel`{{execute}}
`python -m pip install --upgrade tqdm`{{execute}}
`python -m pip install --upgrade twine`{{execute}}

Build the package

`python setup.py sdist bdist_wheel`{{execute}}

Notice contents of the `dist` directory you'll see a versioned sources pakcage and a .`whl` file which is the python module that can be publishd in `pypi` and distributed.

`ls -l dist`{{execute}}

Change out of the project root directory

`cd ..`{{execute}}
