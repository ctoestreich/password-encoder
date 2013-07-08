'use strict'
###
  Password Controller
###
angular.module('passwordEncoderApp')
  .controller 'PasswordCtrl', ['$scope', ($scope) ->
    $scope.length = 12
    $scope.crypto = ''
    $scope.password = ''

    $scope.encodePassword = (message, select) ->
      word = message || $scope.password
      $scope.password = word
      hash = CryptoJS.MD5(word)
      $scope.crypto = $scope.strengthen($scope.truncate(hash.toString(CryptoJS.enc.Base64).replace(/\+/g, '7').replace(/\//g, '2').replace(new RegExp('=', 'g'), '4')))
      $scope.selectText() if select
      $scope.crypto

    $scope.truncate = (text) ->
       length = parseInt($scope.length, 10)
       text = text.substring(0, length) if length > 0 and length < text.length
       text

    $scope.strengthen = (text) ->
       if text.length >= 6
         text = '9' + text.substring(0, text.length - 2) + '3'  unless text.match(/[0-9].*[0-9]/g)
         text = 'N' + text.substring(0, text.length - 2) + 'W'  unless text.match(/[A-Z].*[A-Z]/g)
         text = 'q' + text.substring(0, text.length - 2) + 'b'  unless text.match(/[a-z].*[a-z]/g)
       text

    $scope.selectText = () ->
       e = $('#cryptoText')
       e.focus(->
         @setSelectionRange 0, 9999
         false
        ).mouseup ->
         false

       e.focus()

    return
]
