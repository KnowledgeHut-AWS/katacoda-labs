# Conclusion

This exercise documents how to use Grunt for running builds. For more details on Grunt file visit the links 

- [Sample Gruntfile](https://gruntjs.com/sample-gruntfile)
- [Configuring Tasks](https://gruntjs.com/configuring-tasks)
- [Creating Tasks](https://gruntjs.com/creating-tasks)
- [Creating Plugins](https://gruntjs.com/creating-plugins)

## Exercise

Notice the `"grunt-contrib-jshint": "2.1.0",` line in `Gruntfile.js` this is the [Grunt Jshint Plguin](https://github.com/gruntjs/grunt-contrib-jshint). Refer to this link and configure a `jshint` task in the build which shoudl run **before** the the `ugligy` task.