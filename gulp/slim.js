'use strict';

var gulp = require("gulp");
var slim = require("gulp-slim");

module.exports = function(options) {
  gulp.task('slim', function(){
    gulp.src(options.src + '/app/**/*.slim')
      .pipe(slim({
        pretty: true,
        options: "attr_list_delims={'(' => ')', '[' => ']'}"
      }))
      .pipe(gulp.dest(options.tmp + '/serve/app'));
  });
}
