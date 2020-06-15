# Creating the addressbook app

Run the command

`python manage.py startapp addressbook`{{execute}}, this creates the app under the root `contacts` directory with following directory strcuture

```bash
├── addressbook
│   ├── __init__.py
│   ├── admin.py
│   ├── apps.py
│   ├── migrations
│   │   └── __init__.py
│   ├── models.py
│   ├── tests.py
│   └── views.py
```

---

## Projects vs. apps

What’s the difference between a project and an app? An app is a Web
application that does something – e.g., a Weblog system, a database of
public records or a simple poll app. A project is a collection of
configuration and apps for a particular website. A project can contain
multiple apps. An app can be in multiple projects.

---

Your apps can live anywhere on your Python path. In this tutorial, we’ll
create our poll app right next to your `manage.py` file so that it can
be imported as its own top-level module, rather than a submodule of
`addressbook`.
