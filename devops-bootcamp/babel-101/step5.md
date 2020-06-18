
## Enabling `babel` for webpack and typescript

Remeber webpack loaders? Since we want to use babel for our builds, we will tell webpack to use `babel-loader`

Add dependencies

`npm install @babel/core @babel/preset-env --save-dev`{{execute}}

This gives us only the babel library and predefined plugins for managing enviornments, we still need more libraries to make `babel` compile `typescript`. Run the following commands

`npm install @babel/plugin-proposal-class-properties @babel/plugin-proposal-object-rest-spread @babel/preset-typescript @babel/preset-flow babel-loader --save-dev`{{execute}}

now that we have all the libraries lets configure babel

Create `babelingit/.babelrc`{{open}} file with follwoing code:

<pre class="file" data-filename="babelingit/.babelrc" data-target="replace">
{
  "presets": [
    "@babel/env",
    "@babel/typescript"
    "@babel/flow"
  ],
  "plugins": [
    "@babel/proposal-class-properties",
    "@babel/proposal-object-rest-spread"
  ]
}
</pre>

**Exercise** What happened to `babel.config.json` file? Why not that dear young guns?

You know what? There's an error in the `.babelrc` syntax 

> #evilgrin

Do you know how to fix it?

## Running the build

Once done fixing, add the following goal to the `scripts` section in the `babelingit/package.json`{{open}} file

`"build:js": "webpack --mode=development"`{{copy}}

and the run build script `npm run build:js`{{execute}}

You'll see output similar to

```bash
> babelingit@1.0.0 build:js /Users/anadi/Code/github/knowledgehut/javascript/babel/babelingit
> webpack --mode=development

Hash: b50c540b44a9aaf61d7c
Version: webpack 4.43.0
Time: 1999ms
Built at: 06/18/2020 12:50:43 PM
    Asset      Size  Chunks             Chunk Names
bundle.js  5.69 KiB    main  [emitted]  main
Entrypoint main = bundle.js
[./src/index.ts] 1.66 KiB {main} [built]
```

You can consolidate the compilation and bundling to a single goal via adding followign goal to the `scripts` section

`"build": "npm run build:types && npm run build:js"`{{copy}}

Thats it! We just build `Typescript` through `babel` and bundled our project using `webpack`.

Now go show off to your firends...
