# Getting started with Anaconda

## Installation

Download the latest Anaconda distribution from the following link

`wget https://repo.anaconda.com/archive/Anaconda3-2020.02-Linux-x86_64.sh`{{execute}}

Run the installation

1. `chmod +x Anaconda3-2020.02-Linux-x86_64.sh`{{execute}}
2. `./Anaconda3-2020.02-Linux-x86_64.sh`{{execute}}

### Review the license agreement

The installer prompts “In order to continue the installation process, please review the license agreement.” Click Enter to view license terms

You will see something like this:

```bash
===================================
Anaconda End User License Agreement
===================================

Copyright 2015, Anaconda, Inc.

All rights reserved under the 3-clause BSD License:

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the followin
g conditions are met:

  * Redistributions of source code must retain the above copyright notice, this ....
Scroll to the bottom of the license terms and enter “Yes” to agree.

Do you accept the license terms? [yes|no]
[no] >>>
Please answer 'yes' or 'no':'
>>> yes
```

### Select the Anaconda install location

The installer prompts you to click Enter to accept the default install location, `CTRL-C` to cancel the installation, or specify an alternate installation directory. If you accept the default install location, the installer displays `PREFIX=/home/<user>/anaconda<2 or 3>` and continues the installation. It may take a few minutes to complete.

Anaconda3 will now be installed into this location:
`/root/anaconda3`

  - Press ENTER to confirm the location
  - Press CTRL-C to abort the installation
  - Or specify a different location below

[/root/anaconda3] >>>
NOTE: Make a note of the install location i.e the PREFIX. In this example it is PREFIX=/root/anaconda3

### Add the Anaconda install location to PATH

The installer prompts `“Do you wish the installer to prepend the Anaconda<2 or 3> install location to PATH in your /home//.bashrc ?”` Enter Yes

Open a new Terminal and you will see a promt like so 

```bash
(base) $
```

This means anaconda is running now with base environment. More on that in the next step.