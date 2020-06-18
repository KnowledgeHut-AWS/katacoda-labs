## Building multi components

So far we've manually included all our assets in our `index.html` file, but as your application grows and once you start using hashes in filenames and outputting multiple bundles, it will be difficult to keep managing your `index.html` file manually. However, a few plugins exist that will make this process much easier to manage.

### Adding new component

Create a `webpackit/src/print.js`{{open}} file with following code

<pre class="file" date-filename="webpackit/src/print.js" data-target="replace">
export default function printMe() {
  console.log('I get called from print.js!');
}
</pre>

Update the `webpackit/dist/index.html`{{open}} file with following code

```html
<!doctype html>
<html>
  <head>
    <title>Output Management</title>
    <script src="./print.bundle.js"></script>
  </head>
  <body>
    <script src="./src/main.js"></script>
    <script src="./app.bundle.js"></script>
  </body>
</html>
```

Import the new component in `webpackit/src/index.js`{{open}} file to

<pre class="file" data-filename="webpackit/src/index.js" data-target="replace">
import _ from 'lodash';
import './style.css';
import Img from './image.png';
import printMe from './print.js';

function component() {
	const element = document.createElement('div');
	const btn = document.createElement('button');

	// Lodash, now imported by this script
	element.innerHTML = _.join(['Hello', 'webpack'], ' ');
	element.classList.add('hello');

	// Add the image to our existing div.
	const myImage = new Image();
	myImage.src = Img;

	element.appendChild(myImage);

	btn.innerHTML = 'Click me and check the console!';
	btn.onclick = printMe;
	element.appendChild(btn);

	return element;
}

document.body.appendChild(component());
</pre>

Now update the `webpackit/webpack.config.js`{{open}} file 

<pre class="file" data-filename="webpackit/webpacj.config.js" data-target="replace">
const path = require('path');

module.exports = {
	mode: 'development',
	entry: {
		app: './src/index.js',
		print: './src/print.js',
	},
	output: {
		filename: '[name].bundle.js',
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
			{
				test:/\.(png|svg|jpg|gif)$/,
				use: [
					'file-loader',
				]
			},
			{
				test: /\.(woff|woff2|eot|ttf|otf)$/,
				use: [
					'file-loader',
				]
			},
		],
	},  
};
</pre>

Run the build `npm run build`{{execute}}
