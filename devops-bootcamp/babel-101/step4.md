
For this build we will have to:

1. execute `typescript` compilation to `javascript`
2. compilation to `ECMA2015` with `babel`
3. Use `babel` via `webpack` to build a final bundle

To enable the first step add the following goal to the `babelingit/package.json`{{open}} `scripts` section

`"build:types": "tsc --emitDeclarationOnly"`{{copy}}

We'll now enable webpack congiruation for this project

**Exercise** run the `npm` command to save `webpack` and `webpack-cli` as development dependencies.

Once webpack is installed, we now configure it for this project

Install the following plugin

`npm install fork-ts-checker-webpack-plugin --save-dev`{{execute}}

**Exercise** do aquick research to explain me what purpose this plugin solves?

Create the `babelingit/webpack.config.json`{{open}} file with following code

<pre class="file" data-filename="babelingit/webpack.config.json" data-target="replace">
const path = require('path');
const ForkTsCheckerWebpackPlugin = require('fork-ts-checker-webpack-plugin');

module.exports = {
  //What should be the entry path?
  entry: fill me or build will break,

  output: {
    filename: 'bundle.js',
    path: path.resolve(__dirname, 'dist'),
  },

  resolve: {
    extensions: ['.ts', '.tsx', '.js', '.json']
  },

  module: {
    rules: [{ test: /\.(ts|js)x?$/, loader: 'babel-loader', exclude: /node_modules/ }],
  },

  plugins: [
    new ForkTsCheckerWebpackPlugin(),
  ]
};
</pre>

**Exercise** add the expression for entry module, left it for JavaScript young guns like you!