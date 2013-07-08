'use strict'

describe 'Directive: password', () ->
  beforeEach module 'passwordEncoderApp'

  element = {}

  it 'should make hidden element visible', inject ($rootScope, $compile) ->
    element = angular.element '<password encode="encodePassword(message)"></password>'
    element = $compile(element) $rootScope
    expect(element.text()).toBe 'Input'
