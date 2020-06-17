
Run the following command

`npx webpack`{{execute}}

You'll see output similar to the following

```bash
Hash: 6f278f4aa89b28458708
Version: webpack 4.43.0
Time: 2606ms
Built at: 06/18/2020 12:05:56 AM
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

If you notcie the dist directory you'll see a main.js init along with a lot of `export module` JS code. That's the built file. It relies on the modern ES2015 features to bundle libraries as modules.

**Notice how we managed running a build with no webpack config defined explcitly.**