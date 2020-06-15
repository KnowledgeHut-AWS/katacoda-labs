# Building package

Python packaging refers to preparing your app in a specific format that can be easily installed and used. Django itself is packaged very much like this. For a small app like AddressBook, this process isn’t too difficult.

1. First, create a parent directory for addressbook, outside of your Django project. Call this directory django-addressbook
2. `cd ..`{{execute}}; then `mkdir django-addressbook`{{execute}}

Copy the addressbook directory to this one

`cp -r contacts/addressbook django-addressbook`{{execute}}

Create a file `django-poladdressbookls/README.rst`{{open}} with the following contents

<pre class="file" data-filename="django-addressbook/README.rst" data-target="replace">
=====
AddressBook
=====

AddressBook is a Django app for Web-based AddressBook.

Detailed documentation is in the "docs" directory.

Quick start
-----------

1. Add "addressbook" to your INSTALLED_APPS setting like this::

    INSTALLED_APPS = [
        ...
        'addressbook',
    ]

2. Include the AddressBook URLconf in your project urls.py like this::

    path('addressbook/', include('addressbook.urls')),

3. Run ``python manage.py migrate`` to create the AddressBook models.

4. Start the development server and visit http://127.0.0.1:8000/admin/
   to create a poll (you'll need the Admin app enabled).

5. Visit http://127.0.0.1:8000/addressbook/ to participate in the poll.
</pre>

Create a `django-addressbook/LICENSE`{{open}} file

<pre class="file" data-filename="django-addressbook/LICENSE" data-target="replace">
Copyright (c) 2020 The Python Packaging Authority Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions: The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
</pre>

Next we’ll create setup.cfg and setup.py files which detail how to build and install the app

`django-addressbook/setup.cfg`{{open}} 

<pre class="file" data-filename="django-addressbook/setup.cfg" data-target="replace">
[metadata]
name = django-addressbook
version = 0.1
description = A Django app for Web-based AddressBook.
long_description = file: README.rst
url = https://www.example.com/
author = Your Name
author_email = yourname@example.com
license = BSD-3-Clause  # Example license
classifiers =
    Environment :: Web Environment
    Framework :: Django
    Framework :: Django :: X.Y  # Replace "X.Y" as appropriate
    Intended Audience :: Developers
    License :: OSI Approved :: BSD License
    Operating System :: OS Independent
    Programming Language :: Python
    Programming Language :: Python :: 3
    Programming Language :: Python :: 3 :: Only
    Programming Language :: Python :: 3.6
    Programming Language :: Python :: 3.7
    Programming Language :: Python :: 3.8
    Topic :: Internet :: WWW/HTTP
    Topic :: Internet :: WWW/HTTP :: Dynamic Content

[options]
include_package_data = true
packages = find:
</pre>

and `django-addressbook/setup.py`{{open}} with the following contents:

<pre class="file" data-filename="django-addressbook/setup.py" data-target="replace">
from setuptools import setup

setup()
</pre>

Only Python modules and packages are included in the package by default. To include additional files, we’ll need to create a MANIFEST.in file. The setuptools docs referred to in the previous step discuss this file in more details. To include the templates, the README.rst and our LICENSE file, create a file `django-addressbook/MANIFEST.in`{{open}} with the following contents

<pre class="file" data-filename="django-addressbook/MANIFEST.in" data-target="replace">
include LICENSE
include README.rst
</pre>


Install build packages `python3 -m pip install --upgrade pip setuptools wheel`{{execute}}

To run the build execute `cd django-addressbook`{{execute}} followed by

`python3 setup.py sdist bdist_wheel`{{execute}}

