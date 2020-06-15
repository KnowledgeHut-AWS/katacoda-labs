# Adding business logic to our app

Now we’ll define your models – essentially, your database layout, with additional metadata.

---

## Philosophy

A model is the single, definitive source of truth about your data. It contains the essential fields and behaviors of the data you’re storing. Django follows the DRY Principle. The goal is to define your data model in one place and automatically derive things from it.

This includes the migrations - unlike in Ruby On Rails, for example, migrations are entirely derived from your models file, and are essentially just a history that Django can roll through to update your database schema to match your current models.

---

In our simple poll app, we’ll create a model: `Contact`. A `Contact` has the following contact details

- name
- address
- phone

These concepts are represented by simple Python classes. Edit the `contacts/addressbook/models.py`{{open}} file so it looks like this:

<pre class="file" data-filename="contacts/addressbook/models.py" data-target="replace">
from django.db import models

class Contact(models.Model):
    name = models.CharField(max_length=100, null=False, blank=False)
    address = models.CharField(max_length=200, null=False, blank=False)
    phone_number = models.CharField(max_length=10, unique=True)
</pre>

The code is straightforward. Each model is represented by a class that subclasses `django.db.models.Model`. Each model has a number of class variables, each of which represents a database field in the model.

Each field is represented by an instance of a `Field` class – e.g., `CharField` for character fields and `DateTimeField` for datetimes. This tells Django what type of data each field holds.

The name of each `Field` instance (e.g. `name` or `phone_number`) is the field’s name, in machine-friendly format. You’ll use this value in your Python code, and your database will use it as the column name.

You can use an optional first positional argument to a `Field` to designate a human-readable name. That’s used in a couple of introspective parts of Django, and it doubles as documentation. If this field isn’t provided, Django will use the machine-readable name. Some `Field` classes have required arguments. `CharField`, for example, requires that you give it a `max_length`. That’s used not only in the database schema, but in validation too.

## Activating models

That small bit of model code gives Django a lot of information. With it, Django is able to:

1. Create a database schema (CREATE TABLE statements) for this app.
2. Create a Python database-access API for accessing Question and Choice objects.

But first we need to tell our project that the addressbook app is installed.

To include the app in our project, we need to add a reference to its configuration class in the `INSTALLED_APPS` setting. The AddressbookConfig class is in the `contacts/addressbook/apps.py`{{open}} file, so its dotted path is `'polls.apps.PollsConfig'`. Edit the `contacts/contacts/settings.py`{{open}} file and add that dotted path to the `INSTALLED_APPS` setting. It’ll look like this:

```python
INSTALLED_APPS = [
    'addressbook.apps.AddressbookConfig',
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
]
```

Now Django knows to include the polls app. Let’s run another command:

`python3 manage.py makemigrations addressbook`{{execute}}

you should see similar output 

```bash
Migrations for 'addressbook':
  addressbook/migrations/0001_initial.py
    - Create model Contact
```

By running makemigrations, you’re telling Django that you’ve made some changes to your models (in this case, you’ve made new ones) and that you’d like the changes to be stored as a migration.

Migrations are how Django stores changes to your models (and thus your database schema) - they’re just files on disk. You can read the migration for your new model if you like; it’s the file polls/migrations/0001_initial.py. Don’t worry, you’re not expected to read them every time Django makes one, but they’re designed to be human-editable in case you want to manually tweak how Django changes things.

There’s a command that will run the migrations for you and manage your database schema automatically - that’s called migrate, and we’ll come to it in a moment - but first, let’s see what SQL that migration would run. The sqlmigrate command takes migration names and returns their SQL:

`python3 manage.py sqlmigrate addressbook 0001`{{execute}}

You'll see output similar to this:

```sql
BEGIN;
--
-- Create model Contact
--
CREATE TABLE "addressbook_contact" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "name" varchar(100) NOT NULL, "address" varchar(200) NOT NULL, "phone_number" varchar(10) NOT NULL UNIQUE);
COMMIT;
```

If you’re interested, you can also run `python3 manage.py check`{{execute}}; this checks for any problems in your project without making migrations or touching the database.

Now, run migrate again to create those model tables in your database:

`python3 manage.py migrate`{{execute}}

You should see similar output

```bash
Operations to perform:
  Apply all migrations: addressbook, admin, auth, contenttypes, sessions
Running migrations:
  Applying addressbook.0001_initial... OK
```

The `migrate` command takes all the migrations that haven’t been applied (Django tracks which ones are applied using special table in your database called `django_migrations`) and runs them against your database - essentially, synchronizing the changes you made to your models with the schema in the database.

Migrations are very powerful and let you change your models over time, as you develop your project, without the need to delete your database or tables and make new ones - it specializes in upgrading your database live, without losing data. We’ll cover them in more depth in a later part of the tutorial, but for now, remember the three-step guide to making model changes:

- Change your models (in `models.py`).
- Run `python3 manage.py makemigrations` to create migrations for those
    changes
- Run `python3 manage.py migrate` to apply those changes to the database.

The reason that there are separate commands to make and apply migrations is because you’ll commit migrations to your version control system and ship them with your app; they not only make your development easier, they’re also usable by other developers and in production.

Read the `django-admin` documentation for full information on what the `manage.py` utility can do.
