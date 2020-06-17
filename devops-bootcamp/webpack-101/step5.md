## Configure a `webpack.config.js` file

While webapck relies on a convention approach,  most projects will need a more complex setup, which is why webpack supports a configuration file. This is much more efficient than having to manually type in a lot of commands in the terminal.

Create a `webapckit/webpack.config.js`{{open}} file with following code

<pre class="file" data-filename="webapckit/webpack.config.js" data-target="replace">
const path = require('path');

module.exports = {
  entry: './src/index.js',
  output: {
    filename: 'main.js',
    path: path.resolve(__dirname, 'dist'),
  },
};
</pre>

Now run `npx webpack --config webpack.config.js`{{execute}}

You'll see the build run again with same result as previous run.

```bash
Hash: e547585449231e28a4c5
Version: webpack 4.43.0
Time: 427ms
Built at: 06/18/2020 12:42:30 AM
  Asset      Size  Chunks             Chunk Names
main.js  72.1 KiB       0  [emitted]  main
Entrypoint main = main.js
[1] ./src/index.js 257 bytes {0} [built]
[2] (webpack)/buildin/global.js 472 bytes {0} [built]
[3] (webpack)/buildin/module.js 497 bytes {0} [built]
    + 1 hidden module

WARNING in configuration
The 'mode' option has not been set, webpack will fallback to 'production' for this value. Set 'mode' option to 'development' or 'production' to enable defaults for each environment.
You can also set it to 'none' to disable any default behavior. Learn more: https://webpack.js.org/configuration/mode/
```
## NPM Scripts

We also utilise NPM to run the various webpack commands for our builds

Update the `webpackit/package.json`{{open}} file to the following conetents

<pre class="file" data-filename="webpackit/package.json" data-target="replace">
{
    "name": "webpack-demo",
    "version": "1.0.0",
    "description": "",
    "scripts": {
      "test": "echo \"Error: no test specified\" && exit 1",
      "build": "webpack"
    },
    "keywords": [],
    "author": "",
    "license": "ISC",
    "devDependencies": {
      "webpack": "^4.20.2",
      "webpack-cli": "^3.1.2"
    },
    "dependencies": {
      "lodash": "^4.17.5"
    }
  }
</pre>

Now run `npm run build`{{execute}}, you'll see the build execute with similar output as follows

```bash
> webpackit@1.0.0 build /Users/anadi/Code/github/knowledgehut/javascript/webpack/webpackit
> webpack

Hash: e547585449231e28a4c5
Version: webpack 4.43.0
Time: 549ms
Built at: 06/18/2020 12:47:06 AM
  Asset      Size  Chunks             Chunk Names
main.js  72.1 KiB       0  [emitted]  main
Entrypoint main = main.js
[1] ./src/index.js 257 bytes {0} [built]
[2] (webpack)/buildin/global.js 472 bytes {0} [built]
[3] (webpack)/buildin/module.js 497 bytes {0} [built]
    + 1 hidden module
```
