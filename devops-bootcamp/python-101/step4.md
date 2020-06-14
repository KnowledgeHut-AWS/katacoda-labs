# Python classes

## Simple python class example

Create file `person.py`{{open}} and add the following code

<pre class="file" data-filename="person.py" data-target="replace">
class Person:
    def __init__(self, firstName, lastName = ""):
        super().__init__()
        self.firstName = firstName
        self.lastName = lastName

    def whoAmI(self):
        return self.firstName + " " + self.lastName
</pre>

Execute the following commands in pythong terminal to run this class file

1. Start the python shell `python`{{execute}}
2. `from person import Person`{{execute}}
3. `jason = Person("David", "Weber")`{{execute}}
4. `jason.whoAmI()`{{execute}}
5. Notice the output should be `David Weber` from the method
6. Exit python shell `exit()`{{execute}}
