# Writing a Web Application in Django

In this example we'll create a simple App for contacts which would have the following fields

name
phone
address

This is a high level overview of how our application would work.

<!---![Sample Contacts REST API](https://miro.medium.com/max/2000/1*lAMsvtB6afHwTQYCNM1xvw.png)) --->

## Setup and Installations

1. Setup django `pip install django`{{execute}}
2. Start a new django project `django-admin startproject contacts`{{execute}}

this command creates the project with following directory structure

```bash
contacts
├── contacts
│   ├── __init__.py
│   ├── asgi.py
│   ├── settings.py
│   ├── urls.py
│   └── wsgi.py
└── manage.py
```

These files are:

1. The outer `contacts/` root directory is a container for your project. Its name doesn’t matter to Django; you can rename it to anything you like
2. `manage.py`: A command-line utility that lets you interact with this Django project in various ways
3. The inner `contacts/` directory is the actual Python package for your project. Its name is the Python package name you’ll need to use to import anything inside it (e.g. `contacts.urls`)
4. `contacts/__init__.py`: An empty file that tells Python that this directory should be considered a Python package
5. `contacts/settings.py`: Settings/configuration for this Django project. Django settings will tell you all about how settings work
6. `contacts/urls.py`: The URL declarations for this Django project; a “table of contents” of your Django-powered site
7. `contacts/asgi.py`: An entry-point for [ASGI-compatible](https://asgi.readthedocs.io/en/latest/) [web servers](https://www.uvicorn.org) to serve your project
8. `contacts/wsgi.py`: An entry-point for [WSGI-compatible](https://wsgi.readthedocs.io/en/latest/index.html#) [web servers](https://gunicorn.org) to serve your project

## Running a Django server

`python manage.py runserver`

You’ll see the following output on the command line:

```bash
Performing system checks...

System check identified no issues (0 silenced).

You have unapplied migrations; your app may not work properly until they
are applied. Run 'python manage.py migrate' to apply them.

February 28, 2019 - 15:50:53 Django version 2.1, using settings
'contacts.settings' Starting development server at http://0.0.0.0:8000/
Quit the server with CONTROL-C.
```

If you see other output, that's OK, we'll address it later.

---

### Note

Ignore the warning about unapplied database migrations for now; we’ll
deal with the database shortly.

---

You’ve started the Django development server, a lightweight Web server
written purely in Python. We’ve included this with Django so you can
develop things rapidly, without having to deal with configuring a
production server – such as Apache – until you’re ready for production.

Now’s a good time to note: **don’t** use this server in anything resembling
a production environment. It’s intended only for use while developing.
(We’re in the business of making Web frameworks, not Web servers.)

Now that the server’s running, click on the **runserver** tab. At this
point, you'll likely see a yellow error page. _We'll clear up this error
in a minute!_

## Changing the port

By default, the `runserver` command starts the development server on the
internal IP at port 8000.

Due to the constraints of Katacoda, we had to change the IP and the port
already. If you need to do this in the future, pass it as a command-line
argument. For instance, this command starts the server on port 8080: 

```bash
python3 manage.py runserver 8080
```

If you want to change the server’s IP, pass it along with the port. For
example, to listen on all available public IPs (which is useful if you
are running Vagrant or want to show off your work on other computers on
the network), use:

```bash
python3 manage.py runserver 0:8000
```

`0` is a shortcut for `0.0.0.0`. Full docs for the development server
can be found in the `runserver` reference.

### Automatic reloading of `runserver`

The development server automatically reloads Python code for each
request as needed. You don’t need to restart the server for code changes
to take effect. However, some actions like adding files don’t trigger a
restart, so you’ll have to restart the server in these cases.

### Adding `ALLOWED_HOSTS`

We currently have the app running but with an error message because
we're trying to access it from a host that isn't allowed. By default,
Django only allows requests from `localhost`. This is a good security
measure to keep out nefarious requests.

Open up the `contacts/settings.py`{{open}} file in your editor. Near the top, you should see a
setting named `ALLOWED_HOSTS`. Change it to match:

```python
ALLOWED_HOSTS = ["*"]
```

This will allow any and all hosts to connect to your app. In a
production environment, you'd want to set this to your own domain(s) or
maybe revert it back to an empty list. For learning, though, this is an
acceptable change.

Save the file, restart `runserver` if you killed it, and refresh the web
view. You should now see the green "It worked!" page.

Now that your environment – a “project” – is set up, you’re set to start
doing work.

Each application you write in Django consists of a Python package that
follows a certain convention. Django comes with a utility that
automatically generates the basic directory structure of an app, so you
can focus on writing code rather than creating directories.