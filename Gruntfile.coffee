'use strict'

module.exports = (grunt) ->
  grunt.loadNpmTasks 'grunt-contrib-sass'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-connect'
  grunt.loadNpmTasks 'grunt-slim'
  grunt.registerTask 'build', [ 'clean', 'copy', 'slim', 'sass' ]
  grunt.registerTask 'default', [ 'build', 'connect', 'watch' ]
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
      livereload:
        options:
          livereload: true
        files: ['<%= demodir %>/**/*']
      css:
        files: 'main.scss'
        tasks: [ 'sass' ]
      slim:
        files: '**/*.slim'
        tasks: [ 'slim' ]

    connect:
      options:
        port: 9000
        livereload: 35729
        hostname: 'localhost'
      livereload:
        options:
          open: true
          base: '<%= demodir %>'

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
