'use strict'

describe 'Service: password', () ->

  # load the service's module
  beforeEach module 'passwordEncoderApp'

  # instantiate service
  password = {}
  beforeEach inject (_Password_) ->
    password = _Password_

  it 'check default values', () ->
    expect(!!password).toBe true
    expect(password.crypto).toBe ''
    expect(password.wordLength).toBe 12
    expect(password.word).toBe ''
    expect(password.encoding).toBe 'sjcl'

