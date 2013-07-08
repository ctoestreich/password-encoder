'use strict'

describe 'Controller: PasswordCtrl', () ->

  # load the controller's module
  beforeEach module 'passwordEncoderApp'

  PasswordCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    PasswordCtrl = $controller 'PasswordCtrl', {
      $scope: scope
    }

  it 'should set default properties on the scope', () ->
    expect(scope.length).toBe 12
    expect(scope.crypto).toBe ''
    expect(scope.password).toBe ''

  it 'calling encode should return md5 base64 values', () ->
    expect(scope.encodePassword('a')).toBe '9DMF1ucDxtq3'
    expect(scope.encodePassword('a1')).toBe 'iou3zTQ6oq2Z'
    expect(scope.encodePassword('a1s')).toBe '98eAQopKYJX3'
    expect(scope.encodePassword('a1s2')).toBe '5t228zzKMlFf'