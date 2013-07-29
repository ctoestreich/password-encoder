angular.module('passwordEncoderApp')
  .filter 'uppercase', [() ->
    (input) ->
      input.toUpperCase()
  ]
