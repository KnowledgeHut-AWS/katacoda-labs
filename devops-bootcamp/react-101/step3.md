## Integrate Form Component

To display our React form we must tell webpack to produce an HTML page. The resulting bundle will be placed inside a `<script>` tag.

`npm i html-webpack-plugin html-loader --save-dev`{{execute}}

`clear`{{execute}}

Update the `jarvis/src/webpack.config.js`{{open}} file

<pre class="file" data-filename="jarvis/src/webpack.config.js" data-target="replace">
const HtmlWebPackPlugin = require("html-webpack-plugin");

module.exports = {
  module: {
    rules: [
      {
        test: /\.(js|jsx)$/,
        exclude: /node_modules/,
        use: {
          loader: "babel-loader"
        }
      },
      {
        test: /\.css$/,
        use: [
          "style-loader", "css-loader"
        ]
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
      {
        test: /\.html$/,
        use: [
          {
            loader: "html-loader"
          }
        ]
      }      
    ]
  },
    plugins: [
    new HtmlWebPackPlugin({
      template: "./src/index.html",
      filename: "./index.html"
    })
  ]
};
</pre>

create an HTML file in `jarvis/src/index.html`{{open}}

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>How to set up React, Webpack, and Babel</title>
</head>
<body>
<div id="container"></div>
</body>
</html>
```

We now have to **hook** our React Component to this html file. Append the following code to `jarvis/src/Form.js`{{open}} file

<pre class="file" data-filename="jarvis/src/Form.js" data-target="append">

const wrapper = document.getElementById("container");
wrapper ? ReactDOM.render(<Form />, wrapper) : false;
</pre>

Run build `npm run build`{{execute}} and take a look at the `dist` folder

The `jarvis/dist/index.html`{{open}} file would be transformed to include our React Code
