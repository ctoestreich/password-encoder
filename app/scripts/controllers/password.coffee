'use strict'
###
  Password Controller
###
angular.module('passwordEncoderApp')
  .controller 'PasswordCtrl', ['$scope', 'Password', ($scope, passwordService) ->
    $scope.sjcl = 'btn-info'
    $scope.passwordService = passwordService

    $scope.useHash = (hash) ->
      $scope.passwordService.encoding = hash
      $scope.md5 = if hash is 'md5' then 'btn-info' else ''
      $scope.sha1 = if hash is 'sha1' then 'btn-info' else ''
      $scope.sha2 = if hash is 'sha2' then 'btn-info' else ''
      $scope.sha3 = if hash is 'sha3' then 'btn-info' else ''
      $scope.sjcl = if hash is 'sjcl' then 'btn-info' else ''
      $scope.encodePassword($scope.passwordService.word, true)

    $scope.encodePassword = (word, select) ->
      word = word or $scope.passwordService.word
      return '' if word.trim() is ''
      $scope.passwordService.word = word
      return '' if !select and $scope.passwordService.encoding is 'sjcl'
      $scope.loading = 'password-loading'
      hash = $scope.getHash(word)
      password = $scope.truncate($scope.stripSpecialChars(hash), $scope.passwordService.wordLength)
      if ($scope.isStrongEnough(password))
        $scope.selectText() if select
        $scope.passwordService.crypto = password
        $scope.loading = ''
        return $scope.passwordService.crypto
      return $scope.encodePassword(word + "x", select)

    $scope.stripSpecialChars = (input) ->
      input.toString(CryptoJS.enc.Base64).replace(/\+|\/|=/g, '')

    $scope.isStrongEnough = (input) ->
      return true if input.length < $scope.passwordService.wordLength
      #test for a good mix of upper/lower/numeric
      $scope.containsMinCharTypeMix(input, Math.floor(input.length/6))

    $scope.truncate = (input, length) ->
      if length > 0 and length < input.length
        input = input.substring(0, length)
      return input

    $scope.containsMinCharTypeMix = (input, count) ->
      return $scope.countMatches(input, /[0-9]/g) >= count && $scope.countMatches(input, /[a-z]/g) >= count && $scope.countMatches(input, /[A-Z]/g) >= count

    $scope.countMatches = (input, regex) ->
      return (input.match(regex) || []).length

    $scope.getSJCLHash = (input) ->
      salt = sjcl.codec.base64.toBits("xnChH53E3iwFt4GIG0e5Og29")
#      // make sure our key size is large enough to get the desired length
      keySize = Math.ceil($scope.passwordService.wordLength/4) * 3 * 8 + 48
      start = new Date().getTime()
      hash = sjcl.misc.pbkdf2(input, salt, $scope.passwordService.strengthener, keySize)
      console.log(new Date().getTime() - start)
      sjcl.codec.base64.fromBits(hash)

    $scope.getHash = (word) ->
      hash = $scope.passwordService.encoding || 'sjcl'
      return CryptoJS.SHA1(word) if hash is 'sha1'
      return CryptoJS.SHA256(word) if hash is 'sha2'
      return CryptoJS.SHA3(word) if hash is 'sha3'
      return CryptoJS.MD5(word) if hash is 'md5'
      return $scope.getSJCLHash(word) if hash is 'sjcl'

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
