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
    scope.passwordService.useSpecial = false
    PasswordCtrl = $controller 'PasswordCtrl', {
      $scope: scope
    }

  it 'should set default properties on the scope', () ->
    expect(scope.sjcl).toBe 'btn-info'
    expect(scope.passwordService.wordLength).toBe 12
    expect(scope.passwordService.crypto).toBe ''
    expect(scope.passwordService.encoding).toBe 'sjcl'
    expect(scope.passwordService.word).toBe ''
    expect(scope.passwordService.useSpecial).toBe false
    expect(scope.passwordService.maskInput).toBe true

  it 'calling encode should return sjcl values', () ->
    scope.passwordService.encoding = 'sjcl'
    scope.passwordService.wordLength = 12
    expect(scope.encodePassword('a', true)).toBe 'SOjD7dBLcZi8'
    expect(scope.encodePassword('a1', true)).toBe '9LCZ16qnbTcm'
    scope.passwordService.wordLength = 8
    expect(scope.encodePassword('a', true)).toBe 'SOjD7dBL'
    expect(scope.encodePassword('a1', true)).toBe 'yum9buvY'

  it 'calling encode should return md5 values', () ->
    scope.passwordService.encoding = 'md5'
    scope.passwordService.wordLength = 12
    expect(scope.encodePassword('a')).toBe 'YWjvG9b2cyn8'
    expect(scope.encodePassword('a1')).toBe 'iou3zTQ6oq2Z'
    scope.passwordService.wordLength = 8
    expect(scope.encodePassword('a')).toBe 'DMF1ucDx'
    expect(scope.encodePassword('a1')).toBe 'iou3zTQ6'

  it 'calling encode should return sha1 values', () ->
    scope.passwordService.encoding = 'sha1'
    scope.passwordService.wordLength = 12
    expect(scope.encodePassword('a')).toBe 'Ki4SBrQiKw18'
    expect(scope.encodePassword('a1')).toBe '8pvJG72rFpAw'
    scope.passwordService.wordLength = 8
    expect(scope.encodePassword('a')).toBe 'Ki4SBrQi'
    expect(scope.encodePassword('a1')).toBe '8pvJG72r'

  it 'calling encode should return sha2 values', () ->
    scope.passwordService.encoding = 'sha2'
    scope.passwordService.wordLength = 12
    expect(scope.encodePassword('a')).toBe 'XoU3DlVeldJ9'
    expect(scope.encodePassword('a1')).toBe '9Vxb2b0M2Ama'
    scope.passwordService.wordLength = 8
    expect(scope.encodePassword('a')).toBe 'XoU3DlVe'
    expect(scope.encodePassword('a1')).toBe '9Vxb2b0M'

  it 'calling encode should return sha3 values', () ->
    scope.passwordService.encoding = 'sha3'
    scope.passwordService.wordLength = 12
    expect(scope.encodePassword('a')).toBe 'nEbb7F0D90NS'
    expect(scope.encodePassword('a1')).toBe 'Dkej3H5RmtdG'
    scope.passwordService.wordLength = 8
    expect(scope.encodePassword('a')).toBe 'nEbb7F0D'
    expect(scope.encodePassword('a1')).toBe 'Dkej3H5R'

  it 'calling encode using special should return sjcl values', () ->
    scope.passwordService.encoding = 'sjcl'
    scope.passwordService.useSpecial = true
    scope.passwordService.wordLength = 12
    expect(scope.encodePassword('a', true)).toBe '@7PY3WpUUmK^'
    expect(scope.encodePassword('a1', true)).toBe '@9LCZ16qnbT^'
    scope.passwordService.wordLength = 8
    expect(scope.encodePassword('a', true)).toBe '!SOjD7d^'
    expect(scope.encodePassword('a1', true)).toBe '#05ULdZ~'

  it 'calling encode using special should return md5 values', () ->
    scope.passwordService.encoding = 'md5'
    scope.passwordService.useSpecial = true
    scope.passwordService.wordLength = 12
    expect(scope.encodePassword('a')).toBe '^YWjvG9b2cy$'
    expect(scope.encodePassword('a1')).toBe '#iou3zTQ6oq^'
    scope.passwordService.wordLength = 8
    expect(scope.encodePassword('a')).toBe '$DMF1uc#'
    expect(scope.encodePassword('a1')).toBe '@iou3zT$'

  it 'calling encode using special should return sha1 values', () ->
    scope.passwordService.encoding = 'sha1'
    scope.passwordService.useSpecial = true
    scope.passwordService.wordLength = 12
    expect(scope.encodePassword('a')).toBe '^Fe61oxGp0k$'
    expect(scope.encodePassword('a1')).toBe '@8pvJG72rFp^'
    scope.passwordService.wordLength = 8
    expect(scope.encodePassword('a')).toBe '$Ki4SBr#'
    expect(scope.encodePassword('a1')).toBe '@8pvJG7^'

  it 'calling encode using special should return sha2 values', () ->
    scope.passwordService.encoding = 'sha2'
    scope.passwordService.useSpecial = true
    scope.passwordService.wordLength = 12
    expect(scope.encodePassword('a')).toBe '@ko0uXksQ5z$'
    expect(scope.encodePassword('a1')).toBe '@9Vxb2b0M2A^'
    scope.passwordService.wordLength = 8
    expect(scope.encodePassword('a')).toBe '$XoU3Dl#'
    expect(scope.encodePassword('a1')).toBe '#9Vxb2b~'

  it 'calling encode using special should return sha3 values', () ->
    scope.passwordService.encoding = 'sha3'
    scope.passwordService.useSpecial = true
    scope.passwordService.wordLength = 12
    expect(scope.encodePassword('a')).toBe '#nEbb7F0D90^'
    expect(scope.encodePassword('a1')).toBe '!Dkej3H5Rmt^'
    scope.passwordService.wordLength = 8
    expect(scope.encodePassword('a')).toBe '#nEbb7F^'
    expect(scope.encodePassword('a1')).toBe '!Dkej3H^'