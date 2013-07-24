'use strict'

describe 'Controller: PasswordCtrl', () ->

  # load the controller's module
  beforeEach module 'passwordEncoderApp'

  PasswordCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope, _Password_) ->
    scope = $rootScope.$new()
    scope.passwordService = _Password_
    PasswordCtrl = $controller 'PasswordCtrl', {
      $scope: scope
    }

  it 'should set default properties on the scope', () ->
    expect(scope.sjcl).toBe 'btn-info'
    expect(scope.passwordService.wordLength).toBe 12
    expect(scope.passwordService.crypto).toBe ''
    expect(scope.passwordService.encoding).toBe 'sjcl'
    expect(scope.passwordService.word).toBe ''


  it 'calling encode should return md5 values', () ->
    scope.passwordService.encoding = 'md5'
    scope.passwordService.wordLength = 12
    expect(scope.encodePassword('a')).toBe '9DMF1ucDxtq3'
    expect(scope.encodePassword('a1')).toBe 'iou3zTQ6oq2Z'
    expect(scope.encodePassword('a1s')).toBe '98eAQopKYJX3'
    expect(scope.encodePassword('a1s2')).toBe '5t228zzKMlFf'
    scope.passwordService.wordLength = 8
    expect(scope.encodePassword('a')).toBe '9DMF1uc3'
    expect(scope.encodePassword('a1')).toBe 'iou3zTQ6'
    expect(scope.encodePassword('a1s')).toBe '98eAQop3'
    expect(scope.encodePassword('a1s2')).toBe 'N5t228zW'

  it 'calling encode should return sha1 values', () ->
    scope.passwordService.encoding = 'sha1'
    scope.passwordService.wordLength = 12
    expect(scope.encodePassword('a')).toBe 'NhvfkN2qlp2W'
    expect(scope.encodePassword('a1')).toBe '8pvJG72rFp2A'
    expect(scope.encodePassword('a1s')).toBe '9P2BFRzWIfA3'
    expect(scope.encodePassword('a1s2')).toBe 'CovPb2breao4'
    scope.passwordService.wordLength = 8
    expect(scope.encodePassword('a')).toBe 'N9hvfkNW'
    expect(scope.encodePassword('a1')).toBe '8pvJG72r'
    expect(scope.encodePassword('a1s')).toBe 'q9P2BFRb'
    expect(scope.encodePassword('a1s2')).toBe '9CovPb23'

  it 'calling encode should return sha2 values', () ->
    scope.passwordService.encoding = 'sha2'
    scope.passwordService.wordLength = 12
    expect(scope.encodePassword('a')).toBe '9ypeBEsobvc3'
    expect(scope.encodePassword('a1')).toBe '9V2xb2b0M2Am'
    expect(scope.encodePassword('a1s')).toBe 'vb7584C7mG7a'
    expect(scope.encodePassword('a1s2')).toBe '9mZoMRreuaW3'
    scope.passwordService.wordLength = 8
    expect(scope.encodePassword('a')).toBe '9ypeBEs3'
    expect(scope.encodePassword('a1')).toBe 'N9V2xb2W'
    expect(scope.encodePassword('a1s')).toBe 'Nvb7584W'
    expect(scope.encodePassword('a1s2')).toBe '9mZoMRr3'

  it 'calling encode should return sha3 values', () ->
    scope.passwordService.encoding = 'sha3'
    scope.passwordService.wordLength = 12
    expect(scope.encodePassword('a')).toBe 'H0D8ktokFpR1'
    expect(scope.encodePassword('a1')).toBe 'TyQwp64mf9Tz'
    expect(scope.encodePassword('a1s')).toBe '9fuSWCgbiJa3'
    expect(scope.encodePassword('a1s2')).toBe 'Mh5T3fL2OyAZ'
    scope.passwordService.wordLength = 8
    expect(scope.encodePassword('a')).toBe 'H0D8ktok'
    expect(scope.encodePassword('a1')).toBe 'TyQwp64m'
    expect(scope.encodePassword('a1s')).toBe '9fuSWCg3'
    expect(scope.encodePassword('a1s2')).toBe 'Mh5T3fL2'