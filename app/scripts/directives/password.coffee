angular.module('passwordEncoderApp')
  .directive 'password', [->
    template: '<label class="control-label" for="passwordin"><u>I</u>nput</label><input ng-model="word" ng-change="encode({word: word})" type="password" id="passwordin" accesskey="i" class="input-block-level"/>'
    scope:
      encode: '&'
    restrict: 'E'
  ]
