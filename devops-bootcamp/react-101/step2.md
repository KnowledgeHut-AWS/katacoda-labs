
## Install Webpack

`npm i webpack webpack-cli --save-dev`{{execute}}

Update the `build` command in `scripts` in the `package.json` to:

`"build": "webpack --mode development",`{{copy}}

React components are mostly written in modern `JavaScript` syntax. Take the class keyword for example. Stateful React components can be declared as classes, or as arrow (or regular functions). But older browsers don't understand **ECMAScript 2015**, thus we need some kind of transformation.

That transformation is called `transpiling`. `babel-loader` is the webpack loader responsible for talking to Babel. Babel on the other hand must be configured to use presets. We need two of them:

- babel preset env for compiling modern Javascript down to ES5
- babel preset react for compiling JSX and other stuff down to Javascript

`npm i @babel/core babel-loader style-loader file-loader css-loader @babel/preset-env @babel/preset-react --save-dev`{{execute}}

Next up let's create a React component that:

- has its own state
- renders an HTML form

Create the component in `jarvis/src/Form.js`{{open}}:

<pre class="file" data-filename="jarvis/src/Form.js" data-target="replace">
import React, { Component } from "react";
import ReactDOM from "react-dom";

class Form extends Component {
  constructor() {
    super();

    this.state = {
      value: ""
    };

    this.handleChange = this.handleChange.bind(this);
  }

  handleChange(event) {
    const { value } = event.target;
    this.setState(() => {
      return {
        value
      };
    });
  }

  render() {
    return (
      <form>
        <input
          type="text"
          value={this.state.value}
          onChange={this.handleChange}
        />
      </form>
    );
  }
}

export default Form;

</pre>

Let's add webpack and babel configuration

Open file `jarvis/webpack.config.js`{{open}} and add following code

<pre class="file" data-filename="jarvis/webpack.config.js" data-target="replace">
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
    ]
  }
};

</pre>

Open file `jarvis/.babelrc`{{open}} and add following code

<pre class="file" data-filename="jarvis/.babelrc" data-target="replace">
{
  "presets": ["@babel/preset-env", "@babel/preset-react"]
}
</pre>
