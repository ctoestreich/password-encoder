(function() {
  'use strict';
  /*
    Password Encoder Application
  */

  angular.module('passwordEncoderApp', ['ui.state', 'ui.bootstrap']).config(function($stateProvider) {
    return $stateProvider.state('index', {
      url: '',
      views: {
        password: {
          templateUrl: 'views/password.html'
        },
        menu: {
          templateUrl: 'views/menu/encrypt.html'
        },
        footer: {
          templateUrl: 'views/site/footer.html'
        }
      }
    });
  });

}).call(this);
