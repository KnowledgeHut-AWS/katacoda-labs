We learnt how we can add compoents and modules to the build. However, in large projects, if we changed the name of one of our entry points, or even added a new one? The generated bundles would be renamed on a build, but our index.html file would still reference the old names. Let's fix that with the `HTMLWebpackPlugin`

## Installation

`npm install --save-dev html-webpack-plugin`{{execute}}

Update the `webpackit/webpack.config.js`{{open}} file 

<pre class="file" data-filename="webpackit/webpack.config.js" data-target="replace">
const path = require('path');
const HtmlWebpackPlugin = require('html-webpack-plugin');

module.exports = {
	mode: 'development',
	entry: {
		app: './src/index.js',
		print: './src/print.js',
	},
	plugins: {
		new HtmlWebpackPlugin({
			title: 'Output Management',
		}),
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

Now let's run the build

`npm run build`{{execute}}

Open the `webpackit/dist/index.html`{{open}} and notice contents. The `HtmlWebpackPlugin` by default has generated its own `index.html` file, even though we already have one in the `dist/` folder. This means that it has replaced our `index.html` file with a newly generated one.

## Cleaning up `dist` folder

In general it's good practice to clean the `/dist` folder before each build, so that only used files will be generated. Let's take care of that.

A popular plugin to manage this is the clean-webpack-plugin so let's install and configure it.

`npm install --save-dev clean-webpack-plugin`{{execute}}

Update the `webpackit/webpack.config.js`{{open}} file

<pre class="file" data-filename="webpackit/webpack.config.js" data-target="replace">
const path = require('path');
const HtmlWebpackPlugin = require('html-webpack-plugin');
const { CleanWebpackPlugin } = require('clean-webpack-plugin');

module.exports = {
	mode: 'development',
	entry: {
		app: './src/index.js',
		print: './src/print.js',
	},
	plugins: {
		new CleanWebpackPlugin(),
		new HtmlWebpackPlugin({
			title: 'Output Management',
		}),
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

Now run the build

`npm run build`{{execute}}

and inspect the `/dist` folder. If everything went well you should now only see the files generated from the build and no more old files!

### The Manifest file

This is the file that `webpack` uses to keep a track of what files are being generated. The manifest data can be extracted into a json file for easy consumption using the `WebpackManifestPlugin`.

`npm install --save-dev webpack-manifest-plugin`{{execute}}

Add the config to `webapckit/webpack.config.js`{{open}} file 

<pre class="file" data-filename="webpackit/webpack.config.js" data-target="replace">
const path = require('path');
const HtmlWebpackPlugin = require('html-webpack-plugin');
const { CleanWebpackPlugin } = require('clean-webpack-plugin');
const ManifestPlugin = require('webpack-manifest-plugin');

module.exports = {
	mode: 'development',
	entry: {
		app: './src/index.js',
		print: './src/print.js',
	},
	plugins: [
		new ManifestPlugin(),
		new CleanWebpackPlugin(),
		new HtmlWebpackPlugin({
			title: 'Output Management',
		})
	],
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

Run the build `npm run build`{{execute}} and you will notce the `manifest.json` file is getting generated now.

```bash

> webpackit@1.0.0 build /Users/anadi/Code/github/knowledgehut/javascript/webpack/webpackit
> webpack

Hash: a1b6224fc584c1b9824a
Version: webpack 4.43.0
Time: 3111ms
Built at: 06/18/2020 10:10:10 AM
                                 Asset       Size  Chunks             Chunk Names
 362b56e7c695512490276edce8bdac26.woff   62.2 KiB          [emitted]
  7a31d05183350e057fcb671131a80202.png   85.1 KiB          [emitted]
967e123ad65de8c5d5c464071bdb4979.woff2   45.9 KiB          [emitted]
                         app.bundle.js   76.9 KiB    0, 1  [emitted]  app
                            index.html  251 bytes          [emitted]
                         manifest.json  263 bytes          [emitted]
                       print.bundle.js   1.02 KiB       1  [emitted]  print
Entrypoint app = app.bundle.js
Entrypoint print = print.bundle.js
```

`cat dist/manifest.json`{{exectue}}

**Exercise** Explain how this mechanism affects updating CDN caches during deployment of new builds?