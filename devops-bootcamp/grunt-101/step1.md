## Installing the CLI

In order to get started, you'll want to install Grunt's command line interface (CLI) globally. You may need to use sudo (for OSX, *nix, BSD etc) or run your command shell as Administrator (for Windows) to do this.

`npm install -g grunt-cli`{{execute}}

**Note** that installing grunt-cli does not install the Grunt task runner!

The job of the Grunt CLI is simple: run the version of Grunt which has been installed next to a Gruntfile. This allows multiple versions of Grunt to be installed on the same machine simultaneously.

### How the CLI works

The cli loads grunt by looking for installed versions throgh the `require()` nodejs system. It then applied configuration from Gruntfile to the local installation to run tasks.

## Preparing a new Grunt project

**Adding a Gruntfile:** This file is named Gruntfile.js or Gruntfile.coffee and is used to configure or define tasks and load Grunt plugins. Preparing a project to use grunt simply involved adding `grunt-cli` as a `devDependency` to `package.json` and a `Gruntfile`

### Step 1

Create the directory structure `mkdir -p my-grunt-project/src`{{execute}}

We'll add simple javascript source in the `src` directory to demo the grunt build.