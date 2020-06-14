# Python classes

## Simple python class example

Create file `person.py`{{open}} with following content

```python
class Person:
    def __init__(self, firstName, lastName = ""):
        super().__init__()
        self.firstName = firstName
        self.lastName = lastName

    def whoAmI(self):
        return self.firstName + " " + self.lastName
```

Execute the following commands to run this class file 

1. `from person import Person`{{execute}}
2. `jason = Person("David", "Weber")`{{execute}}
3. `jason.whoAmI()`{{execute}}