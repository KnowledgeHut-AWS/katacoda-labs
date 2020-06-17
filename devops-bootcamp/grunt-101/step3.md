## Build Confguration

Create the `my-grunt-project/package.json`{{open}} file and add the following content to it:

<pre class="file" data-filename="my-grunt-project/package.json" data-target="replace">
{
  "name": "my-grunt-project",
  "version": "0.1.0",
  "devDependencies": {
    "grunt": "1.1.0",
    "grunt-contrib-jshint": "2.1.0",
    "grunt-contrib-uglify": "4.0.1"
  }
}
</pre>

Now that we have `grunt` as dependency in our project, let's define the `my-grunt-project/Gruntfile.js`{{open}} file

<pre class="file" data-filename="my-grunt-project/Gruntfile.js" data-target="replace">
module.exports = function(grunt) {

  // Project configuration.
  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),
    uglify: {
      options: {
        banner: '/*! <%= pkg.name %> <%= grunt.template.today("yyyy-mm-dd") %> */\n'
      },
      build: {
        src: 'src/<%= pkg.name %>.js',
        dest: 'build/<%= pkg.name %>.min.js'
      }
    }
  });

  // Load the plugin that provides the "uglify" task.
  grunt.loadNpmTasks('grunt-contrib-uglify');

  // Default task(s).
  grunt.registerTask('default', ['uglify']);

};
</pre>

We now have:

1. A package definition that `grunt` will use to refer to the source code
2. A build configuration with `uglify` task

We will now proceed to running the `grunt` build