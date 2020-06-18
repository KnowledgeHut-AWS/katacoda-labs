## Loaders

Loaders are transformations that are applied to the source code of a module. They allow you to pre-process files as you import or “load” them. Thus, loaders are kind of like “tasks” in other build tools and provide a powerful way to handle front-end build steps. Loaders can transform files from a different language (like TypeScript) to JavaScript or load inline images as data URLs. Loaders even allow you to do things like import CSS files directly from your JavaScript modules!

Example
For example, you can use loaders to tell webpack to load a CSS file or to convert TypeScript to JavaScript. To do this, you would start by installing the loaders you need:

`npm install --save-dev style-loader css-loader`{{execute}}

And then instruct webpack to use the css-loader for every .css file and the ts-loader for all .ts files:

```javascript
webpack.config.js

module.exports = {
  module: {
    rules: [
      { test: /\.css$/, use: 'css-loader' },
      { test: /\.ts$/, use: 'ts-loader' }
    ]
  }
};
```

We'll see how to add configuration of CSS Loader to our project.

Edit the `webpackit/webpack.config.js`{{open}} file to following code:

<pre class="file" data-filename="webpackit/webpack.config.js" data-target="replace">
const path = require('path');

module.exports = {
  mode: 'development',
	entry: './src/index.js',
	output: {
		filename: 'main.js',
		path: path.resolve(__dirname, 'dist'),
	},
	module: {
		rules: [
		{
			test: /\.css$/,
			use: [
			'style-loader',
			'css-loader',
			],
		},
		],
	},  
};
</pre>

Let's add a `CSS` file `webpackit/src/style.css`{{open}} to the project

<pre class="file' data-filename="webpackit/src/style.css" data-target="replace">
.hello {
  color: red;
}
</pre>

And import it to our `webpackit/src/index.js`{{open}} file

<pre class="file' data-filename="webpackit/src/index.js" data-target="replace">
import _ from 'lodash';
import './style.css';

function component() {
  const element = document.createElement('div');

  // Lodash, now imported by this script
  element.innerHTML = _.join(['Hello', 'webpack'], ' ');
  element.classList.add('hello');

  return element;
}

document.body.appendChild(component());
</pre>

Run the build `npm run build`{{execute}} and amongst other things you'll notice 


```bash
[4] ./src/style.css 519 bytes {0} [built]
[6] ./node_modules/css-loader/dist/cjs.js!./src/style.css 258 bytes {0} [built]
```

### Exercise

Install package `npm install --save-dev file-loader`{{execute}}

What will be the configuration for emaling the `file-loader` to process a `webpackit/src/icon.png` file in the project?

Updated: `webpackit/src/style.css`{{open}} code

<pre class="file" data-filename="webapckit/src/style.css" data-target="replace">
.hello {
  color: red;
  background: url('./image.png');
}
</pre>

Updated: `webpackit/src/infex.js`{{open}} code

<pre class="file" data-filename="webapckit/src/index.js" data-target="replace">
  import _ from 'lodash';
  import './style.css';
  import Img from './image.png';

  function component() {
    const element = document.createElement('div');

    // Lodash, now imported by this script
    element.innerHTML = _.join(['Hello', 'webpack'], ' ');
    element.classList.add('hello');

    // Add the image to our existing div.
    const myImage = new Image();
    myImage.src = Img;

    element.appendChild(myImage);

    return element;
}

  document.body.appendChild(component());
</pre>

**TODO** the webpack.config.js code to enable build with these changes
