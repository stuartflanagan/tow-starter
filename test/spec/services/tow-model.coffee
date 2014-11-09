'use strict'

describe 'Service: towModel', ->

  # load the service's module
  beforeEach module 'towApp'

  # instantiate service
  towModel = {}
  beforeEach inject (_towModel_) ->
    towModel = _towModel_

  it 'should do something', ->
    expect(!!towModel).toBe true
