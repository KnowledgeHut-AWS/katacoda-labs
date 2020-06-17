## Setup

We'll first install the `webpack` command line runner package the `webpack-cli`

`npm install -g webpack-cli`{{execute}}

We'll create the directory strcuture to get started with our exercises next

1. `mkdir webpackit`{{execute}}
2. `cd webpackit`{{execute}}

Initialise and empty project:

`npm init -y`{{execute}}

install webpack to the project

`npm install webpack webpack-cli --save-dev`{{execute}}

In the time that it took Avengers to ge back in past,get Black Window killed and come back with Thanos and fight again, you'll notice the `webpackit/package.json`{{open}} is now populated with dependencies

```json
{
  "name": "webpackit",
  "version": "1.0.0",
  "description": "",
  "main": "index.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "keywords": [],
  "author": "Groot <groot@guardians.com> (https://www.iamgroot.com)",
  "license": "ISC",
  "devDependencies": {
    "webpack": "^4.43.0",
    "webpack-cli": "^3.3.11"
  }
}
```

We have our project strcuture ready, lets build our app now.
