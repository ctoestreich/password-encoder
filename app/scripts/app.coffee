'use strict'
###
  Password Encoder Application
###
angular.module('passwordEncoderApp', [])
  .config ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'views/main.html'
      .otherwise
        redirectTo: '/'
