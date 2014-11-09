'use strict'

describe 'Service: towBaseObject', ->

  # load the service's module
  beforeEach module 'towApp'

  # instantiate service
  towBaseObject = {}
  beforeEach inject (_towBaseObject_) ->
    towBaseObject = _towBaseObject_

  it 'should do something', ->
    expect(!!towBaseObject).toBe true
