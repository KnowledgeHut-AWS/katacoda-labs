# Common PIP commands

When you install pip, a pip command is added to your system, which can be run from the command prompt as follows:

`pip help`{{execute}}

If you cannot run the pip command directly (possibly because the location where it was installed isn’t on your operating system’s PATH) then you can run pip via the Python interpreter:

`python -m pip help`{{execute}}

On Windows, the py launcher can be used:

`py -m pip help`

The most common scenario is to install from PyPI using requirement specifiers

1. To install a package `pip install sphinx`{{execute}}
2. To install a specific version `pip install chios==0.1.5`{{execute}}
3. To install minimum version, the current latest version of the `rstfmt` package for example is 0.0.3, and we wan that our apckage version should be atleast `0.0.2` then `pip install 'rstfmt>=0.0.2'`{{execute}}

Installing from a requirements file

A `requirements.txt` defines all modules to be installed, usually as a dependency to a given project.

`touch requirements.txt`{{execute}}

<pre class="file" data-filename="requirements.txt" data-target="replace">
sphinx
more-itertools
pyyaml
mock
argparse
</pre>

`pip` can install all the dependencies from this file through the command

`pip install -r requirements.txt`{{execute}}

While `requirements.txt` lists ala dependencies, the `constaints.txt` file, only control which version of a requirement is installed, not whether it is installed or not. You can use containts file for pip installation as follows:

`pip install -c constraints.txt`

“Wheel” is a built, archive format that can greatly speed installation compared to building and installing from source archives. `pip` prefers Wheels where they are available. To install from a wheel

`pip install my_example_project/dist/example_pkg_kh-0.0.1-py3-none-any.whl`{{execute}}

For the cases where wheels are not available, pip offers pip wheel as a convenience, to build wheels for all your requirements and dependencies.

pip wheel requires the wheel package to be installed, which provides the “bdist_wheel” setuptools extension that it uses.

`pip install wheel`
`pip wheel --wheel-dir=/local/wheels -r requirements.txt`

to install those requirements just using your local directory of wheels

`pip install --no-index --find-links=/local/wheels -r requirements.txt`

To uninstall a package

`pip uninstall example_pkg_kh`

To list installed packages

`pip list`{{execute}}

To list outdated packages, and show the latest version available:

`pip list --outdated`{{execute}}

To show details about an installed package:

`pip show sphinx`{{execute}}

To search for a package

`pip search "sphinx"`{{execute}}