# `django-admin` and `manage.py` commands

Usage

`manage.py <command> [options]`

or

`django-admin <command> [options]`

## Available Commands

### `check`

By default, all apps will be checked. You can check a subset of apps by providing a list of app labels as arguments:

`django-admin check auth admin addressbook`

If you do not specify any app, all apps will be checked.

`--tag TAGS, -t TAGS`
The system check framework performs many different types of checks that are categorized with tags. You can use these tags to restrict the checks performed to just those in a particular category. For example, to perform only models and compatibility checks, run:

`django-admin check --tag models --tag compatibility`{{execute}}

`--list-tags`
Lists all available tags.

`--deploy`
Activates some additional checks that are only relevant in a deployment setting.

You can use this option in your local development environment, but since your local development settings module may not have many of your production settings, you will probably want to point the check command at a different settings module, either by setting the `DJANGO_SETTINGS_MODULE` environment variable, or by passing the `--settings` option:

`django-admin check --deploy --settings=production_settings`

Or you could run it directly on a production or staging deployment to verify that the correct settings are in use (omitting `--settings`). You could even make it part of your integration test suite.

`--fail-level {CRITICAL,ERROR,WARNING,INFO,DEBUG}`

Specifies the message level that will cause the command to exit with a non-zero status. Default is ERROR.

---

### `createcachetable`

`django-admin createcachetable`{{exectue}}
Creates the cache tables for use with the database cache backend using the information from your settings file. See Django’s cache framework for more information.

`--database DATABASE`
Specifies the database in which the cache table(s) will be created. Defaults to default.

`--dry-run`
Prints the SQL that would be run without actually running it, so you can customize it or use the migrations framework.

---

### `dbshell`

`django-admin dbshell`
Runs the command-line client for the database engine specified in your ENGINE setting, with the connection parameters specified in your USER, PASSWORD, etc., settings.

For PostgreSQL, this runs the `psql` command-line client.
For MySQL, this runs the `mysql` command-line client.
For SQLite, this runs the `sqlite3` command-line client.
For Oracle, this runs the `sqlplus` command-line client.
This command assumes the programs are on your `PATH` so that a call to the program name (`psql`, `mysql`, `sqlite3`, `sqlplus`) will find the program in the right place. There’s no way to specify the location of the program manually.

`--database DATABASE`

Specifies the database onto which to open a shell. Defaults to default

---

### `loaddata`

`django-admin loaddata fixture [fixture ...]`
Searches for and loads the contents of the named fixture into the database.

`--database DATABASE`
Specifies the database into which the data will be loaded. Defaults to default.

`--ignorenonexistent, -i`
Ignores fields and models that may have been removed since the fixture was originally generated.

`--app APP_LABEL`
Specifies a single app to look for fixtures in rather than looking in all apps.

`--format FORMAT`
Specifies the serialization format (e.g., `json` or `xml`) for fixtures read from stdin.

`--exclude EXCLUDE, -e EXCLUDE`
Excludes loading the fixtures from the given applications and/or models (in the form of app_label or app_label.ModelName). Use the option multiple times to exclude more than one app or model.

***What’s a “fixture”?***

A fixture is a collection of files that contain the serialized contents of the database. Each fixture has a unique name, and the files that comprise the fixture can be distributed over multiple directories, in multiple applications.

Django will search in three locations for fixtures:

1. In the fixtures directory of every installed application
2. In any directory named in the FIXTURE_DIRS setting
3. In the literal path named by the fixture
4. Django will load any and all fixtures it finds in these locations that match the provided fixture names.

If the named fixture has a file extension, only fixtures of that type will be loaded. For example:

`django-admin loaddata mydata.json`

would only load JSON fixtures called mydata. The fixture extension must correspond to the registered name of a serializer (e.g., `json` or `xml`)

---

### `inspectdb`

`django-admin inspectdb [table [table ...]]`

Introspects the database tables in the database pointed-to by the NAME setting and outputs a Django model module (a models.py file) to standard output.

You may choose what tables or views to inspect by passing their names as arguments. If no arguments are provided, models are created for views only if the `--include-views` option is used. Models for partition tables are created on PostgreSQL if the `--include-partitions` option is used.

Use this if you have a legacy database with which you’d like to use Django. The script will inspect the database and create a model for each table within it.

---

### `makemigrations`

`django-admin makemigrations [app_label [app_label ...]]`
Creates new migrations based on the changes detected to your models. Migrations, their relationship with apps and more are covered in depth in the migrations documentation.

Providing one or more app names as arguments will limit the migrations created to the app(s) specified and any dependencies needed (the table at the other end of a ForeignKey, for example).

To add migrations to an app that doesn’t have a migrations directory, run makemigrations with the app’s app_label.

`--noinput, --no-input`
Suppresses all user prompts. If a suppressed prompt cannot be resolved automatically, the command will exit with error code 3.

`--empty`
Outputs an empty migration for the specified apps, for manual editing. This is for advanced users and should not be used unless you are familiar with the migration format, migration operations, and the dependencies between your migrations.

`--dry-run`
Shows what migrations would be made without actually writing any migrations files to disk. Using this option along with `--verbosity 3` will also show the complete migrations files that would be written.

`--merge`
Enables fixing of migration conflicts.

`--name NAME, -n NAME`
Allows naming the generated migration(s) instead of using a generated name. The name must be a valid Python identifier.

`--no-header`
Generate migration files without Django version and timestamp header.

`--check`
Makes makemigrations exit with a non-zero status when model changes without migrations are detected.

---

### `migrate`

`django-admin migrate [app_label] [migration_name]`
Synchronizes the database state with the current set of models and migrations. Migrations, their relationship with apps and more are covered in depth in the migrations documentation.

The behavior of this command changes depending on the arguments provided:

1. `No arguments`: All apps have all of their migrations run
2. `<app_label>`: The specified app has its migrations run, up to the most recent migration. This may involve running other apps’ migrations too, due to dependencies
3. `<app_label> <migrationname>`: Brings the database schema to a state where the named migration is applied, but no later migrations in the same app are applied. This may involve unapplying migrations if you have previously migrated past the named migration. You can use a prefix of the migration name, e.g. `0001`, as long as it’s unique for the given app name. Use the name zero to migrate all the way back i.e. to revert all applied migrations for an app.

```bash
Warning

When unapplying migrations, all dependent migrations will also be unapplied, regardless of <app_label>. You can use --plan to check which migrations will be unapplied.
```

`--database DATABASE`
Specifies the database to migrate. Defaults to **default**.

`--fake`
Marks the migrations up to the target one (following the rules above) as applied, but without actually running the SQL to change your database schema.

This is intended for advanced users to manipulate the current migration state directly if they’re manually applying changes; be warned that using `--fake` runs the risk of putting the migration state table into a state where manual recovery will be needed to make migrations run correctly.

`--fake-initial`
Allows Django to skip an app’s initial migration if all database tables with the names of all models created by all CreateModel operations in that migration already exist. This option is intended for use when first running migrations against a database that preexisted the use of migrations. This option does not, however, check for matching database schema beyond matching table names and so is only safe to use if you are confident that your existing schema matches what is recorded in your initial migration.

`--plan`
Shows the migration operations that will be performed for the given migrate command.

`--run-syncdb`
Allows creating tables for apps without migrations. While this isn’t recommended, the migrations framework is sometimes too slow on large projects with hundreds of models.

`--noinput, --no-input`
Suppresses all user prompts. An example prompt is asking about removing stale content types
