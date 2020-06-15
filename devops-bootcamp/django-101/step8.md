# Adding persistence

`python3 manage.py shell`{{execute}}

`from addressbook.models import Contact`{{execute}}

`Contact.objects.all()`{{execute}}

The output would be `<QuerySet []>` empty data as there are no records
`c = Contact(name="David Webb", address="71st Street, New York", phone_number="0123456780")`{{execute}}

To save the object into the database. You have to call `save()` explicitly.
`c.save()`{{execute}}

Now it has an ID.
`c.id`{{execute}}

To access fields of the object `c.name`{{execute}}; `c.address`{{execute}}; `c.phone_number`{{Execute}}

Query objects in the databse again
`Contact.objects.all()`{{execute}}

The `<QuerySet [<Contact: Contact object (1)>]>` isn't quite helpful, let's create a string representation for the object

`quit()`{{excute}} the python shell, and add the following code to the `contacts/addressbook/models.py`{{open}} file

<pre class="file" data-filename="contacts/addressbook/models.py" data-target="append">

    def __str__(self):
    	return "{ name=" + self.name + ", address=" + self.address + ", phone_number=" + self.phone_number + " }"

</pre>

Launch the shell again `python3 manage.py shell`{{execute}}

`from addressbook.models import Contact`{{execute}}
`Contact.objects.all()`{{execute}}
`quit()`{{execute}}