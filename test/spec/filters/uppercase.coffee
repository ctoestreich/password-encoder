'use strict'

describe 'Filter: uppercase', () ->

  # load the filter's module
  beforeEach module 'passwordEncoderApp'

  # initialize a new instance of the filter before each test
  uppercase = {}
  beforeEach inject ($filter) ->
    uppercase = $filter 'uppercase'

  it 'should return the input prefixed with "uppercase filter:"', () ->
    text = 'angularjs'
    expect(uppercase text).toBe (text.toUpperCase());
