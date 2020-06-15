# Running NodsJS Builds

Let's create another app this time

`mkdir my_node_app`{{execute}}; change to this directorty `cd my_node_app`

Create a `my_node_app/server.js`{{open}} file with following code

<pre class="file" data-filename="my_node_app/server.js" data-target="replace">
'use strict';

const express = require('express');

// Constants
const PORT = 8080;
const HOST = '0.0.0.0';

// App
const app = express();
app.get('/', (req, res) => {
  res.send('Hello World');
});

app.listen(PORT, HOST);
console.log(`Running on http://${HOST}:${PORT}`);
</pre>

## Writing the `package.json`

The npm command looks for a package.json to build node packages. Amongst other meta information, this package also has details of other package our app depends on, and any sepcific build tasks too, which we will discuss shortly. Create the `my_node_app/package.json` package with the following code

<pre class="file" data-filename="my_node_app/package.json" data-target="replace">
{
  "name": "my_node_app",
  "version": "1.0.0",
  "description": "My Node.js App",
  "author": "Tony Stark <tony.stark@marvel.com>",
  "main": "server.js",
  "scripts": {
    "start": "node server.js"
  },
  "dependencies": {
    "express": "^4.16.1"
  }
}
</pre>

## Making code runnable

Run `npm install`

## Running the code 

run `npm start`

## Building the package

Run `npm publish --access=public`