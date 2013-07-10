'use strict';
###
  Password Service
###
angular.module('passwordEncoderApp')
  .service 'Password', () ->
    encoding: 'md5'
    word: ''
    crypto: ''
    wordLength: 12
