'use strict';
###
  Password Service
###
angular.module('passwordEncoderApp')
  .service 'Password', () ->
    encoding: 'sjcl'
    word: ''
    crypto: ''
    wordLength: 12
    strengthener: 10000
    useSpecial: false
    maskInput: true
