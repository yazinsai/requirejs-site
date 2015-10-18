'use strict'

module.exports = (grunt) ->
  grunt.loadNpmTasks 'grunt-contrib-sass'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-open'
  grunt.loadNpmTasks 'grunt-slim'
  grunt.registerTask 'default', [ 'watch' ]
  grunt.registerTask 'build', [ 'clean', 'copy', 'slim', 'sass', 'open' ]
  grunt.initConfig
    demodir: 'demo'
    pkg: grunt.file.readJSON('package.json')
    slim:
      options:
        option: 'attr_list_delims={\'(\' => \')\', \'[\' => \']\'}'
        pretty: false
        bundleExec: false
      dist:
        files: {
          '<%= demodir %>/index.html': 'demo.slim'
        }
    sass:
      options:
        style: 'compressed'
        loadPath: '.'
      demo:
        files: {
          '<%= demodir %>/main.css': 'main.scss'
        }
    watch:
      css:
        files: 'main.scss'
        tasks: [ 'sass' ]
      slim:
        files: '<%= demodir %>/**/*.slim'
        tasks: [ 'slim' ]
    open:
      demo:
        path: '<%= demodir %>/index.html'
        app: 'Google Chrome'

    ###
    You should be using the below 'copy' block for your project as well. It's
    used to copy the shared resources from the style-guide to your particular
    project .. and includes things like:
      - fonts
      - images
    ###
    copy:
      fonts:
        files: [{
          expand: true,
          src: ['fonts/**'],
          dest: '<%= demodir %>',
        }]
      images:
        files: [{
          expand: true,
          src: ['images/**'],
          dest: '<%= demodir %>',
        }]
    clean:
      all: files: [{ '<%= demodir %>/ ' }]
  return
