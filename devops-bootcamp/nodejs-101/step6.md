# Writing an Express App

## Installation

Make sure you are the root directory; then create a diretory for the project and change to it

`cd`{{Execute}}

`mkdir project-yellowjacket`{{execute}}

`cd project-yellowjacket`{{execute}}

We will use the command `npx express-generator --view=jade`{{execute}} to create our express application, you'll see output similar to following

```bash
npx: installed 10 in 2.603s

   create : public/
   create : public/javascripts/
   create : public/images/
   create : public/stylesheets/
   create : public/stylesheets/style.css
   create : routes/
   create : routes/index.js
   create : routes/users.js
   create : views/
   create : views/error.jade
   create : views/index.jade
   create : views/layout.jade
   create : app.js
   create : package.json
   create : bin/
   create : bin/www

   install dependencies:
     $ npm install

   run the app:
     $ DEBUG=project-yellowjacket:* npm start
```

## Updating the index view and running app

Open the `project-yellowjacket/views/index.jade`{{execute}} and add following code to it

<pre class="file" data-filename="project-yellowjacket/views/index.jade" data-target="replace">
extends layout

block content
  h1= title
  p We are in a tussle with Pym Technologies on Yellow Jacket. Who will save us?
</pre>

### Configuring Enviornment Properties

Values like host and port are called configurable properties because they can change between enviornments. The best way to record this environment specific information therefore is through configuration file. In this example we will use the [dotenv](https://www.npmjs.com/package/dotenv) package to read the port to which our application should bind.

Create file `project-yellowjacket/.env`{{open}}, add the following configuration to it

<pre class="file" data-filename="project-yellowjacket/.env" data-target="replace">
NODE_ENV=development
PORT=8626
</pre>

Install the `dotenv` package `npm install dotenv --save`{{execute}}

Now open the `project-yellowjacket/bin/www`{{open}} file and the add the lines 

```javascript
const dotenv = require('dotenv');
dotenv.config();
```

right below the line `var http = require('http');`

This will eanble our `expressjs` application to read value for `PORT` from the `.env` file

Run the app by first executing `npm install`{{execute}} to install all dependencies, followed by:

`npm start`{{execute}}

Click on the `ExpressJS` tab and it should show you the home page.

## Adding basic routing

Open the `project-yellowjacket/routes/index.js`{{open}} to add a new `route`:

<pre class="file" data-filename="project-yellowjacket/routes/index.js" data-target="replace">
var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Welcome to Marvel World' });
});

router.get('/scottlang', function (req, res) {
  res.send('But I am just a theif!')
})

module.exports = router;

</pre>

Routing refers to determining how an application responds to a client request to a particular endpoint, which is a `URI` (or path) and a specific `HTTP` request method (`GET`, `POST`, and so on).

Each route can have one or more handler functions, which are executed when the route is matched.

Route definition takes the following structure:

`app.METHOD(PATH, HANDLER)`

Where:

- `app` is an instance of express.
- `METHOD` is an `HTTP` request method, in lowercase.
- `PATH` is a path on the server.
- `HANDLER` is the function executed when the route is matched

Restart the app and visit link [/scottlang](https://[[HOST_SUBDOMAIN]]-9000-[[KATACODA_HOST]].environments.katacoda.com/scottlang) to see the new route ender a response.

## Adding a view response

While the previous example send a simple `HTTP` responses projects generally return complex data to views. That's what we will do in this step.

Create a new file `project-yellowjacket/views/antman.jade`{{open}} with following code

<pre class="file" data-filename="project-yellowjacket/views/antman.jade" data-target="replace">
extends layout

block content
  h1= title
  p= message
</pre>

Open the `project-yellowjacket/routes/index.js`{{open}} to add a new `route`:

<pre class="file" data-filename="project-yellowjacket/routes/index.js" data-target="replace">
var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Welcome to Marvel World' });
});

router.get('/scottlang', function (req, res) {
  res.send('But I am just a theif!')
})

router.get('/savepym', function (req, res) {
  res.send('antman', { title: 'Save Pym Technologies!'}, message: 'Here comes the Ant Man!')
})

module.exports = router;
</pre>

Restart the app and visit [/savepym](https://[[HOST_SUBDOMAIN]]-9000-[[KATACODA_HOST]].environments.katacoda.com/savepym)