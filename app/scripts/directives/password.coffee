'use strict';
###
  Password Directive
###
angular.module('passwordEncoderApp')
  .directive 'password', [->
    template: '<label class="control-label" for="passwordin"><u>I</u>nput</label><input ng-model="pass" ng-change="encode({message: pass})" type="text" id="passwordin" accesskey="i" class="input-block-level"/>'
    scope:
      encode: '&'
    restrict: 'E'
  ]
