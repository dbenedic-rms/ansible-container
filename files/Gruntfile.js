// Watches for ansible yaml changes

module.exports = function (grunt) {

  grunt.loadNpmTasks('grunt-shell');
  grunt.loadNpmTasks('grunt-contrib-watch');

  grunt.initConfig({
    currentFile: 'test.yml',
    watch: {
      files: ['/ansible/**/*.yml']
    },
    shell: {
      ansible_lint: {
        command: 'ansible-lint <%= currentFile %>'
      },
    },
  });

  // Only lint changed files
  grunt.event.on('watch', function(action, filepath, target) {
    grunt.config('currentFile', filepath);
    grunt.task.run('shell:ansible_lint');
  });

}
