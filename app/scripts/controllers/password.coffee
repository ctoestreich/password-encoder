'use strict'
###
  Password Controller
###
angular.module('passwordEncoderApp')
  .controller 'PasswordCtrl', ['$scope', 'Password', ($scope, passwordService) ->
    $scope.md5 = 'btn-info'
    $scope.passwordService = passwordService

    $scope.useHash = (hash) ->
      $scope.passwordService.encoding = hash
      $scope.md5 = if hash is 'md5' then 'btn-info' else ''
      $scope.sha1 = if hash is 'sha1' then 'btn-info' else ''
      $scope.sha2 = if hash is 'sha2' then 'btn-info' else ''
      $scope.sha3 = if hash is 'sha3' then 'btn-info' else ''
      $scope.encodePassword($scope.passwordService.word, true)
      return

    $scope.encodePassword = (word, select) ->
      word = word or $scope.passwordService.word
      return '' if word.trim() is ''
      $scope.passwordService.word = word
      hash = $scope.getHash($scope.passwordService.encoding, word)
      $scope.passwordService.crypto = $scope.strengthen($scope.truncate(hash.toString(CryptoJS.enc.Base64).replace(/\+/g, '7').replace(/\//g, '2').replace(new RegExp('=', 'g'), '4')))
      $scope.selectText() if select
      $scope.passwordService.crypto

    $scope.getHash = (hash, word) ->
      return CryptoJS.SHA1(word) if hash is 'sha1'
      return CryptoJS.SHA256(word) if hash is 'sha2'
      return CryptoJS.SHA512(word) if hash is 'sha3'
      return CryptoJS.MD5(word)

    $scope.truncate = (text) ->
       length = parseInt($scope.passwordService.wordLength, 10)
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
