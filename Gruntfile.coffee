module.exports = (grunt) ->
  grunt.loadNpmTasks 'grunt-gorilla'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-stylus'
  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-karma'

  ASSETS = 'App/assets'
  PUBLIC = 'App/public'  

  grunt.registerTask 'build', ['clean','gorilla','stylus','watch']

  grunt.registerTask 'start', 'start the app', ->
    {exec} = require 'child_process'
    callback = @async()
    exec 'node app.js', (err, stdout, stderr) ->
      return console.log err if err
      console.log stdout
      callback()

  grunt.initConfig
    watch  :
      coffee :
        files : [
          "#{ASSETS}/**/*.gs"
          "#{ASSETS}/**/*.styl"
        ]
        tasks : ['gorilla','stylus']

    clean : ["#{PUBLIC}/js", "#{PUBLIC}/css"]

    gorilla :
      transpile :
        expand : true
        cwd    : ASSETS
        src    : ['**/*.gs']
        dest   : PUBLIC
        ext    : '.js'

    stylus :
      transpile :
        files     :
          'App/public/styl/main.css' : ['App/assets/styl/main.styl']

    karma :
      unit  :
        configFile : 'App/karma.conf.coffee'