# Common PIP commands

When you install pip, a pip command is added to your system, which can be run from the command prompt as follows:

`pip <pip arguments>`

If you cannot run the pip command directly (possibly because the location where it was installed isn’t on your operating system’s PATH) then you can run pip via the Python interpreter:

`python -m pip <pip arguments>`

On Windows, the py launcher can be used:

`py -m pip <pip arguments>`

The most common scenario is to install from PyPI using requirement specifiers

`pip install SomePackage`            # latest version
`pip install SomePackage==1.0.4`     # specific version
`pip install 'SomePackage>=1.0.4'`     # minimum version

Installing from a requirements file, let's say we have a `requirements.txt` with following content

```text
sphinx
more-itertools
pyyaml
mock
argparse
```

`pip` can install all the dependencies from this file through the command

`pip install -r requirements.txt`

While `requirements.txt` lists ala dependencies, the `constaints.txt` file, only control which version of a requirement is installed, not whether it is installed or not. You can use containts file for pip installation as follows:

`pip install -c constraints.txt`

“Wheel” is a built, archive format that can greatly speed installation compared to building and installing from source archives. `pip` prefers Wheels where they are available. To install from a wheel 

`pip install SomePackage-1.0-py2.py3-none-any.whl`

For the cases where wheels are not available, pip offers pip wheel as a convenience, to build wheels for all your requirements and dependencies.

pip wheel requires the wheel package to be installed, which provides the “bdist_wheel” setuptools extension that it uses.

`pip install wheel`
`pip wheel --wheel-dir=/local/wheels -r requirements.txt`

to install those requirements just using your local directory of wheels

`pip install --no-index --find-links=/local/wheels -r requirements.txt`

To uninstall a package

`pip uninstall SomePackage`

To list installd package

```bash
pip list
```

To list outdated packages, and show the latest version available:

`pip list --outdated`

To show details about an installed package:

`pip show sphinx`

To search for a package

`pip search "sphinx"`