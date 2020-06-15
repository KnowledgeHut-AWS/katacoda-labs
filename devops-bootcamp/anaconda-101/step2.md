# Managing packages in Anacoda using conda

Conda is an open-source package management system and environment management system that runs on Windows, macOS, and Linux. Conda quickly installs, runs, and updates packages and their dependencies. Conda easily creates, saves, loads, and switches between environments on your local computer. It was created for Python programs but it can package and distribute software for any language.

## Common Conda commands

Conda works on the concept of **environments**, which are basically different versions of python or packages combinations

### Conda management

Verify conda is installed, check version number

`conda info`{{execute}}
  
Update conda to the current version

`conda update conda`{{execute}}
`clear`{{execute}}

### Using conda for packages

Search for packages

`conda search scipy`{{execute}}
`clear`{{execute}}

Installing a package

`conda install sphinx`{{execute}}
`clear`{{execute}}

Uninstall package

`conda uninstall sphinx`{{execute}}
`clear`{{execute}}

### Using environments

Create a new environment named py35, install Python 3.7

`conda create --name py37 python=3.7`{{execute}}
`clear`{{execute}}

Activate the new environment to use it

`conda activate py37`{{execute}}

Get a list of all environments

`conda env list`{{execute}}

The active enviornments is shown with an `*`

List all packages and versions installed in active environment

`clear`{{execute}}
`conda list`{{execute}}

List the history of each change to the current environment

`conda list --revisions`{{execute}}

Restore environment to a previous revision

`conda install --revision 2`

Save environment to a text file

`conda list --explicit > bio-env.txt`

Delete an environment and everything in it

`conda env remove --name bio-env`

Create environment from a text file

`conda env create --file bio-env.txt`







