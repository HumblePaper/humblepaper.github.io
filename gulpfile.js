var gulp = require('gulp');
var webserver = require('gulp-webserver');
var shell = require('gulp-shell');
// built-in tool
var path = require('path');
var join = path.join;

watch = require('./semantic/tasks/watch'),
build = require('./semantic/tasks/build');
// import task with a custom task name
gulp.task('watch ui', watch);
gulp.task('build ui', build);


// webserve task
gulp.task('server' , function()
{
    gulp.src('./dest')
        .pipe(webserver({
             livereload: true,
             open: true
        }));
});

gulp.task('rollup' , shell.task([
       'rollup -c'
 ]));

gulp.task('watch' , function()
{
     gulp.watch(['./src/**/*.tag', './src/**/*.js', './src/index.js'] , ['rollup']);

});

gulp.task('default' , ['watch' , 'server' , 'rollup', 'watch ui']);