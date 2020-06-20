## Writing a simple Angular App

### Step 1

Install Angular CLI

`npm install -g @angular/cli`{{execute}}

### Step 2

Create an angular project

`ng new angularly --skip-git`{{execute}}

Choose Yes and CSS respectively on the questions 

```bash
? Would you like to add Angular routing? Yes
? Which stylesheet format would you like to use? CSS
```

Let's look at the directory strcuture

`cd angularly`{{execute}}
`ls -ltr`{{execute}}

You'll notice that other than `package.json` and `tsconfig.json` we have lot more files here

- `tslint.json` file provides configuration for **code conventions** check and enforces global industry standards via warnings and errors mechanism
- `karma.conf.js` is a testing framework.The main goal for Karma is to bring a productive testing environment to developers. The environment being one where they don't have to set up loads of configurations, but rather a place where developers can just write the code and get instant feedback from their tests
- `tsconfig.spec.json` is the tests cofiguration for this project
- `tsconfig.app.json` is the application configuration for this project
- `angular.json` provides workspace-wide and project-specific configuration defaults for build and development tools provided by the Angular CLI. Path values given in the configuration are relative to the root workspace folder.

### Step 3

Test if application is runnable

`ng serve`{{execute}}

Open the `ngServe` tab to see the default application page or click  

[Angularly Home Page](https://[[HOST_SUBDOMAIN]]-4200-[[KATACODA_HOST]].environments.katacoda.com/)

This means we've got the installation right. 

Exit the command thereafter. We'll now add some more agular code
