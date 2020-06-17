
We'll add a source directory to our project `mkdir src`{{execute}}

Add a `webapckit/src/index.js`{{open}} file with following code

<pre class="file" data-filename="webpackit/src/index.js" data-target="replace">
function component() {
  const element = document.createElement('div');

  // Lodash, currently included via a script, is required for this line to work
  element.innerHTML = _.join(['Hello', 'webpack'], ' ');

  return element;
}

document.body.appendChild(component());
</pre>

We'll also add the `webpackit/src/index.html`{{open}} file for running our JS code, add the following code to it.

```html
<!doctype html>
<html>
  <head>
    <title>Getting Started</title>
    <script src="https://unpkg.com/lodash@4.16.6"></script>
  </head>
  <body>
    <script src="./src/index.js"></script>
  </body>
</html>
```

We also need to adjust our `webpackit/package.json`{{open}} file in order to make sure we mark our package as private, as well as removing the main entry. This is to prevent an accidental publish of your code.

<pre class="file" data-filename="webpackit/package.json" data-target="replace">
{
  "name": "webpackit",
  "version": "1.0.0",
  "description": "Webpack-ing it",
  "private": true,
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
</pre>

In this example, there are implicit dependencies between the `<script>` tags. Our index.js file depends on lodash being included in the page before it runs. This is because index.js never explicitly declared a need for `lodash`; it just assumes that the global variable _ exists.

There are problems with managing JavaScript projects this way:

1. It is not immediately apparent that the script depends on an external library.
2. If a dependency is missing, or included in the wrong order, the application will not function properly.
3. If a dependency is included but not used, the browser will be forced to download unnecessary code.
4. Let's use webpack to manage these scripts instead.

run `npm install --save lodash`{{execute}}

Now, lets import lodash in our script:

<pre class="file" data-filename="webpackit/src/index.js" data-target="replace">
import _ from 'lodash';

function component() {
  const element = document.createElement('div');

  // Lodash, now imported by this script
  element.innerHTML = _.join(['Hello', 'webpack'], ' ');

  return element;
}

document.body.appendChild(component());
</pre>

Now, since we'll be bundling our scripts, we have to update our index.html file. Let's remove the lodash `<script>`, as we now import it, and modify the other `<script>` tag to load the bundle, instead of the raw /src file; make following chages to the `webpackit/src/index.html`{{open}} file, save and close it.

```html
<!doctype html>
<html>
  <head>
    <title>Getting Started</title>
  </head>
  <body>
    <script src="./src/main.js"></script>
  </body>
</html>
```

Next we move the `index.htnl` file to a new `mkdir dist`{{execute}} directory as this file doesn't contribute to our build

`mv src/index.html dist/index.html`{{execute}}
