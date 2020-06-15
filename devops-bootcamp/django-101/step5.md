# Writing views and models for the application

Let’s write the first view. Open the file `contacts/addressbook/views.py`{{open}} with the following Python code in it:

<pre class="file" data-filename="contacts/addressbook/views.py" data-target="replace">
from django.http import HttpResponse

def index(request):
    return HttpResponse("Hello, world. You're at the addressbook index.")
</pre>

This is the simplest view possible in Django. To call the view, we need to map it to a URL - and for this we need a URLconf.

To create a URLconf in the `addressbook` directory, create `contacts/addressbook/urls.py`{{open}}. Your app directory should now look like:

```bash
addressbook/
    __init__.py
    admin.py
    apps.py
    migrations/
        __init__.py
    models.py
    tests.py
    urls.py
    views.py
```

In the `contacts/addressbook/urls.py` file include the following code:

<pre class="file" data-filename="contacts/addressbook/urls.py" data-target="replace">
from django.urls import path

from . import views

urlpatterns = [
    path('', views.index, name='index'),
]
</pre>

The next step is to point the root URLconf at the `addressbook.urls` module. In `contacts/contacts/urls.py`{{open}}, add an import for `django.urls.include` and insert an `include()` in the `urlpatterns` list, so you have:

<pre class="file" data-filename="contacts/addressbook/urls.py" data-target="replace">
from django.contrib import admin
from django.urls import include, path

urlpatterns = [
    path('addressbook/', include('addressbook.urls')),
    path('admin/', admin.site.urls),
]
</pre>

The `include()` function allows referencing other URLconfs. Whenever Django encounters `include()`, it chops off whatever part of the URL matched up to that point and sends the remaining string to the included URLconf for further processing.

The idea behind `include()` is to make it easy to plug-and-play URLs. Since `addressbook` are in their own URLconf (`addressbook/urls.py`), they can be placed under `"/addressbook/"`, or under `"/fun_addressbook/"`, or under
`"/content/addressbook/"`, or any other path root, and the app will still work.

---

**When to use `include()`**

You should always use `include()` when you include other URL patterns. `admin.site.urls` is the only exception to this.

---

You have now wired an `index` view into the URLconf. Lets verify it’s working, run the following command if you've stopped your server:

`python3 manage.py runserver 0:8000`{{execute}}

Unfortunately, we can't change the URL in the **runserver** tab, so click the button on that tab that looks like a box with an escaping arrow. This should open a new tab in your browser. Now you can change the URL so it ends with `/addressbook/` and you should see the text _“Hello, world. You’re at the addressbook index.”_, which you defined in the index view.

---

**Page not found?**

> If you get an error page here, check that you’re going to https://[[HOST_SUBDOMAIN]]-8000-[[KATACODA_HOST]].environments.katacoda.com/addressbook/ and not https://[[HOST_SUBDOMAIN]]-8000-[[KATACODA_HOST]].environments.katacoda.com/.

---

The `path()` function is passed four arguments, two required: `route` and `view`, and two optional: `kwargs`, and `name`. At this point, it’s worth reviewing what these arguments are for.

**`path()` argument: `route`**

`route` is a string that contains a URL pattern. When processing a request, Django starts at the first pattern in `urlpatterns` and makes its way down the list, comparing the requested URL against each pattern until it finds one that matches.

Patterns don’t search GET and POST parameters, or the domain name. For example, in a request to `https://www.example.com/myapp/`, the URLconf will look for `myapp/`. In a request to `https://www.example.com/myapp/?page=3`, the URLconf will also look for `myapp/`.

**`path()` argument: `view`**

When Django finds a matching pattern, it calls the specified view function with an `HttpRequest` object as the first argument and any “captured” values from the route as keyword arguments. We’ll give an example of this in a bit.

**`path()` argument: `kwargs`**

Arbitrary keyword arguments can be passed in a dictionary to the target view. We aren’t going to use this feature of Django in the tutorial.

**`path()` argument: `name`**

Naming your URL lets you refer to it unambiguously from elsewhere in Django, especially from within templates. This powerful feature allows you to make global changes to the URL patterns of your project while only touching a single file.