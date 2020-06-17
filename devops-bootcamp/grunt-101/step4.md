
To run the build change to the project directory `cd my-grunt-project`{{execute}} and run

`npm install`{{execute}} followed by `grunt`{{execute}}

You'll see output similar to 

```bash
Running "uglify:build" (uglify) task
>> 1 file created 965 B → 354 B

Done.
```

Notice the contents of `my-grunt-project/build` directory `ls -l build`{{execute}} followed by `cat build/my-grunt-project.min.js`{{execute}}. You'll see an ***uglified*** JS file.

### The `grunt` build explained

Noticed the line `>> 1 file created 965 B → 354 B` in `grunt` build output? Thats the `uglify` plugin doing it's job.

`pkg: grunt.file.readJSON('package.json'),` tells grunt to read package information from the `package.json` file

```javascript
    uglify: {
      options: {
        banner: '/*! <%= pkg.name %> <%= grunt.template.today("yyyy-mm-dd") %> */\n'
      },
      build: {
        src: 'src/<%= pkg.name %>.js',
        dest: 'build/<%= pkg.name %>.min.js'
      }
    }
```

This  block is where we confgiure `uglify` plugin to 
1. add a comment documenting when the build was run
2. directory where source files are located i.e. `src: 'src/<%= pkg.name %>.js',`
3. name of the source file i.e. `<%= pkg.name %>.js`
4. desitnation of built file and it's name i.e. `dest: 'build/<%= pkg.name %>.min.js'` and `<%= pkg.name %>.min.js` respetively

`grunt.registerTask('default', ['uglify']);` this line tells grunt to run `uglify` as the default task when none is defined.