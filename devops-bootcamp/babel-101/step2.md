
## Introduction

Presets are pre-defined set of plugins to reduce configuration clutter. Presets can act as an array of Babel plugins or even a sharable options config.

Official Presets

1. @babel/preset-env
2. @babel/preset-flow
3. @babel/preset-react
4. @babel/preset-typescript

### Creating a Preset

To make your own preset, you just need to export a config.

It could just return an array of plugins..

```javascript
module.exports = function() {
  return {
    plugins: [
      "pluginA",
      "pluginB",
      "pluginC",
    ]
  };
}
```

Presets can contain other presets, and plugins with options.

```javascript
module.exports = () => ({
  presets: [
    require("@babel/preset-env"),
  ],
  plugins: [
    [require("@babel/plugin-proposal-class-properties"), { loose: true }],
    require("@babel/plugin-proposal-object-rest-spread"),
  ],
});
```

### Preset Paths

If the preset is on npm, you can pass in the name of the preset and babel will check that it's installed in node_modules

```json
{
  "presets": ["babel-preset-myPreset"]
}
```

You can also specify an relative/absolute path to your presets.

```json
{
  "presets": ["./myProject/myPreset"]
}
```

### Preset Shorthand

If the name of the package is prefixed with babel-preset-, you can use a shorthand:

```json
{
  "presets": [
    "myPreset",
    "babel-preset-myPreset" // equivalent
  ]
}
```

This also works with scoped packages:

```json
{
  "presets": [
    "@org/babel-preset-name",
    "@org/name" // equivalent
  ]
}
```

### Preset Ordering

Preset ordering is reversed (last to first).

```json
{
  "presets": [
    "a",
    "b",
    "c"
  ]
}
```

Will run in the following order: c, b, then a. This was mostly for ensuring backwards compatibility, since most users listed "es2015" before "stage-0".

### Preset Options

Both plugins and presets can have options specified by wrapping the name and an options object in an array inside your config.

For specifying no options, these are all equivalent:

```json
{
  "presets": [
    "presetA",
    ["presetA"],
    ["presetA", {}],
  ]
}
```

To specify an option, pass an object with the keys as the option names.

```json
{
  "presets": [
    ["@babel/preset-env", {
      "loose": true,
      "modules": false
    }]
  ]
}
```
