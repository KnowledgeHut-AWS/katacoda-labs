
## Babel CLI

There are quite a few tools in the Babel toolchain that try to make it easy for you to use Babel whether you're an "end-user" or building an integration of Babel itself. This will be a quick introduction to those tools in next few slides.

### Overview

This guide will show you how to compile your JavaScript application code that uses `ES2015+` syntax into code that works in current browsers. That will involve both transforming new syntax and polyfilling missing features.

Create a project directory with source

`mkdir babel-baby-steps`{{execute}}

`cd babel-baby-steps`{{execute}}

`npm init -y`{{execute}}

Add the src direcotry `mkdir src`{{execute}}

Add source `babel-baby-steps/src/clock.js`{{open}}

<pre class="file" data-filename="babel-baby-steps/src/clock.js" data-target="replace">
var wakeuptime = 7;
var noon = 12;
var lunchtime = 12;
var naptime = lunchtime + 2;
var partytime;
var evening = 18;

// Getting it to show the current time on the page
var showCurrentTime = function()
{
    // display the string on the webpage
    var clock = document.getElementById('clock');
 
    var currentTime = new Date();
 
    var hours = currentTime.getHours();
    var minutes = currentTime.getMinutes();
    var seconds = currentTime.getSeconds();
    var meridian = "AM";
 
    // Set hours
	  if (hours >= noon)
	  {
		  meridian = "PM";
	  }

	  if (hours > noon)
	  {
		  hours = hours - 12;
	  }
 
    // Set Minutes
    if (minutes < 10)
    {
        minutes = "0" + minutes;
    }
 
    // Set Seconds
    if (seconds < 10)
    {
        seconds = "0" + seconds;
    }
 
    // put together the string that displays the time
    var clockTime = hours + ':' + minutes + ':' + seconds + " " + meridian + "!";
 
    clock.innerText = clockTime;
};
</pre>

The entire process to set up babel compilation involves:

1. Running these commands to install the packages:

`npm install --save-dev @babel/core @babel/cli @babel/preset-env`{{execute}}

and

`npm install --save @babel/polyfill`{{execute}}

2. Creating a config file named `babel-baby-steps/babel.config.json`{{open}} in the root of your project with this content:

<pre class="file" data-filename="babel-baby-steps/babel.config.json" data-target="replace">
{
  "presets": [
    [
      "@babel/env",
      {
        "targets": {
          "edge": "17",
          "firefox": "60",
          "chrome": "67",
          "safari": "11.1",
        },
        "useBuiltIns": "usage",
        "corejs": "3.6.4",
      }
    ]
  ]
}
</pre>

The browsers list above is just an arbitrary example. You will have to adapt it for the browsers you want to support.

3. And running this command to compile all your code from the src directory to lib:

`npx babel src --out-dir lib`{{execute}}

You'll see the out put

```bash
Successfully compiled 1 file with Babel (716ms).
```

Check the `lib` directory

`ls -l lib`{{execute}}

and you'll notice the build generated file.

`cd`{{execute}}
