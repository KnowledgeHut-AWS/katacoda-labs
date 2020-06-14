# Eeectuable Modules

To create an 'executable' module, i.e. modules that can run from the command line with python interpreter we need to make some changes. Open the `kh_module.py`{{open}} and add following code to the end of file

```python
if __name__ == "__main__":
    import sys
    fibonacci(int(sys.argv[1]))
```

1. We've created a main method which calls the fibbonaci serires function
2. You can see that `import` is a scoped statements which means you can import for the entire module or import for particular method

To run this module now simply run `python kh_module.py`{{execute}}
