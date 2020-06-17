## Modules

The `import` and `export` statements have been standardized in `ES2015`. They are supported in most of the browsers at this moment, however there are some browsers that don't recognize the new syntax. But don't worry, webpack does support them out of the box.

Behind the scenes, webpack actually "transpiles" the code so that older browsers can also run it. If you inspect `dist/main.js`, you might be able to see how webpack does this, it's quite ingenious!

Note that webpack will not alter any code other than import and export statements.

## Using a Configuration

Webapck follows a convention over confiuration approach so for simpler cases you do not need a configuration file.

## Understanding the how webpack workd

To get started you only need to understand its Core Concepts:

- Entry
- Output
- Loaders
- Plugins
- Mode
- Browser Compatibility

### Entry

An entry point indicates which module webpack should use to begin building out its internal dependency graph. webpack will figure out which other modules and libraries that entry point depends on (directly and indirectly).

By default its value is `./src/index.js`, but you can specify a different (or multiple entry points) by setting an entry property in the webpack configuration. For example:

```javascript
webpack.config.js

module.exports = {
  entry: './path/to/my/entry/file.js'
};
```

### Output

The output property tells webpack where to emit the bundles it creates and how to name these files. It defaults to `./dist/main.js` for the main output file and to the `./dist` folder for any other generated file.

You can configure this part of the process by specifying an output field in your configuration:

```javascript
webpack.config.js

const path = require('path');

module.exports = {
  entry: './path/to/my/entry/file.js',
  output: {
    path: path.resolve(__dirname, 'dist'),
    filename: 'my-first-webpack.bundle.js'
  }
};
```

In the example above, we use the output.filename and the output.path properties to tell webpack the name of our bundle and where we want it to be emitted to. In case you're wondering about the path module being imported at the top, it is a core `Node.js` module that gets used to manipulate file paths.

### Loaders

Webpack only understands JavaScript and JSON files by default. Loaders allow webpack to process other types of files and convert them into valid modules that can be consumed by your application and added to the dependency graph.

```javascript
const path = require('path');

module.exports = {
  output: {
    filename: 'my-first-webpack.bundle.js'
  },
  module: {
    rules: [
      { test: /\.txt$/, use: 'raw-loader' }
    ]
  }
};
```

You may read further customization when including loaders in the [Webpack Loaders Documentation](https://webpack.js.org/concepts/loaders).

### Plugins

In order to use a plugin, you need to `require()` it and add it to the plugins array. Most plugins are customizable through options. Since you can use a plugin multiple times in a configuration for different purposes, you need to create an instance of it by calling it with the new operator.

```javascript
const HtmlWebpackPlugin = require('html-webpack-plugin'); //installed via npm
const webpack = require('webpack'); //to access built-in plugins

module.exports = {
  module: {
    rules: [
      { test: /\.txt$/, use: 'raw-loader' }
    ]
  },
  plugins: [
    new HtmlWebpackPlugin({template: './src/index.html'})
  ]
};
```

In the example above, the `html-webpack-plugin` generates an HTML file for your application by injecting automatically all your generated bundles.

### Mode

By setting the mode parameter to either development, production or none, you can enable webpack's built-in optimizations that correspond to each environment. The default value is production.

```javascript
module.exports = {
  mode: 'production'
};
```

**Exercise** set mode to development in our sample project.

### Browser Compatibility

`webpack` supports all browsers that are ES5-compliant (IE8 and below are not supported). webpack needs `Promise` for `import()` and `require.ensure()`. If you want to support older browsers, you will need to use a [polyfill](https://webpack.js.org/guides/shimming/) before using these expressions.