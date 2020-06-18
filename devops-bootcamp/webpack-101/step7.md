# Adding Font Loaders

Adding font files to proecessed by webpack works pretty similar to other assets.

Update the `webpackit/webpack.config.js`{{open}} file to following code

<pre class="file" data-filenmae="webpackit/webpack.config.js" data-target="replace">
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

update the `webpackit/src/style.css`{{open}} file to following code

<pre class="file" data-filename="webpackit/src/style.css" data-target="replace">
@font-face {
  font-family: 'OpenSans';
  src:  url('./font.woff2') format('woff2'),
        url('./font.woff') format('woff');
  font-weight: 600;
  font-style: normal;
}

.hello {
  color: red;
  background: url('./image.png');
}
</pre>

Download the font files from [this url](https://github.com/sorenson/open-sans-woff/tree/master/fonts/Regular) and move them to `src` folder with names `font.woff` and `font.woff2` respectively.

Run the build `npm run build`{{execute}}

You'll notice the output now contains

```bash
Hash: 79e0a39f30eb655951f3
Version: webpack 4.43.0
Time: 3154ms
Built at: 06/18/2020 9:19:02 AM
                                 Asset      Size  Chunks             Chunk Names
 362b56e7c695512490276edce8bdac26.woff  62.2 KiB          [emitted]
  7a31d05183350e057fcb671131a80202.png  85.1 KiB          [emitted]
967e123ad65de8c5d5c464071bdb4979.woff2  45.9 KiB          [emitted]
                               main.js  76.7 KiB       0  [emitted]  main
```

amongst other things.
