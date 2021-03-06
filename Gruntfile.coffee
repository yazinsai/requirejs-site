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
    livereloadPort: 35730
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
          livereload: '<%= livereloadPort %>'
        files: ['<%= demodir %>/**/*']
      css:
        files: '**/*.scss'
        tasks: [ 'sass' ]
      slim:
        files: '**/*.slim'
        tasks: [ 'slim' ]

    clean:
      all: files: [{ '<%= demodir %>/ ' }]

    # Launches our web server for autoreload preview
    connect:
      options:
        port: 9000
        livereload: '<%= livereloadPort %>'
        hostname: 'localhost'
      livereload:
        options:
          open: true
          base: '<%= demodir %>'

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
  return
