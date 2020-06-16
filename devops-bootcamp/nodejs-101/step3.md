# Running NodsJS Builds

## Register to npmjs

NodeJS applications can be packaged as modules and distribbuted via the NPMJS registry. We have to create and account there to publish our modules. Run the following in terminal

1. `npm set init.author.name "YOUR_AUTHOR_NAME"`{{copy}}
2. `npm set init.author.email "YOUR_EMAIL_ADDRESS"`{{copy}}
3. `npm set init.author.url "YOUR_AUTHOR_URL"`{{copy}}

Register to npmjs with `npm adduser`{{execute}}

provide a username, password and valid email. You'll recieve a validation email from NPM Inc, click on the validation link to activate your account.

## Creating an app

Let's create another app this time

`mkdir my_node_app`{{execute}}; change to this directorty `cd my_node_app`{{execute}}

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

The npm command looks for a package.json to build node packages. Amongst other meta information, this package also has details of other package our app depends on, and any sepcific build tasks too, which we will discuss shortly. Create the `my_node_app/package.json`{{open}} file with the following code

<pre class="file" data-filename="my_node_app/package.json" data-target="replace">
{
  "name": "[Your_NPM_USERNAME]/my_node_app",
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

Change `[Your_NPM_USERNAME]` to the username you chose for npm

## Making code runnable

Run `npm install`{{execute}}

## Running the code

run `npm start`{{execute}}

You may click on the `NodeApp` tab this time to see the new browser page load with the `Hello World` message.

Hit `CTRL-C` to the terminal when done. `clear`{{execute}}

## Publish the package (optional)

Run `npm publish --access=public`{{execute}} to publish on npmjs

`clear`{{execute}}