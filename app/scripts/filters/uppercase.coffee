'use strict';
###
  Password Encoder Service
###
angular.module('passwordEncoderApp')
  .filter 'uppercase', [() ->
    (input) ->
      input.toUpperCase()
  ]
