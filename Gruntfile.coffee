module.exports = (grunt) ->
  
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'
    
    jst:
      app:
        options:
          processName: (filename) ->
            filename.replace('_templates/', '').replace('._', '')
          namespace: "Application.Templates"
        files:
          "_includes/js/templates.js": "_templates/*._"
        
    stylus:
      app:
        files:
          "_includes/css/app.css": "_styl/*.styl"
          
    watch:
      cs:
        files: ["_cs/*"]
        tasks: [ 'coffeelint', 'concat', 'coffee']
        options:
          interrupt: true
          forceWatchMethod: 'old'
      jst:
        files: ["_templates/*"]
        tasks: 'jst'
        options:
          interrupt: true
          forceWatchMethod: 'old' 
      css:
        files: ["_styl/*"]
        tasks: "stylus"
        options:
          interrupt: true
          forceWatchMethod: 'old'

    coffeelint:
      app: "_cs/**.coffee"
    
    concat:
      coffee:
        src:  ["_cs/*.coffee", "_cs/*/*.coffee"]
        dest: "_app.coffee"

    coffee:
      app:
        files: 
          "_includes/js/app.js": "_app.coffee"
          
    uglify:
      app:
        files:
          "_includes/js/app.js": "_includes/js/app.js"
      templates:
        files:
          "_includes/js/templates.js": "_includes/js/templates.js"
          
    cssmin:
      compress:
        files:
          "_includes/css/app.css": "_includes/css/app.css"
    clean:
      cs: "_app.coffee"
      dsstore: "**/.DS_Store"
    
    csslint:
      css:
        src: "_includes/css/app.css"
        rules:
          "ids": false  
                  
  grunt.loadNpmTasks 'grunt-contrib-concat'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-cssmin'
  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-coffeelint'
  grunt.loadNpmTasks 'grunt-jekyll'
  grunt.loadNpmTasks 'grunt-contrib-imagemin'
  grunt.loadNpmTasks 'grunt-css'
  grunt.loadNpmTasks 'grunt-contrib-stylus'
  grunt.loadNpmTasks 'grunt-contrib-jst'

  grunt.registerTask 'cs', ["coffeelint", "concat", "coffee"]
  grunt.registerTask 'default', ["cs", "jst", "stylus", "uglify", "cssmin", "clean"]