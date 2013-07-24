'use strict'
###
  Password Encoder Application
###
angular.module('passwordEncoderApp', ['ui.state'])
  .config ($stateProvider) ->
    $stateProvider.state('index',
      url: ''
      views:
        password:
          templateUrl: 'views/password.html'
        menu:
          templateUrl: 'views/menu/encrypt.html'
        footer:
          templateUrl: 'views/site/footer.html'
    )

#    $routeProvider
#      .when '/',
#        templateUrl: 'views/md5.html'
#        controller: 'PasswordCtrl'
#      .otherwise
#        redirectTo: '/'
