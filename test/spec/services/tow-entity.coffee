'use strict'

describe 'Service: towEntity', ->

  # load the service's module
  beforeEach module 'towApp'

  # instantiate service
  towEntity = {}
  beforeEach inject (_towEntity_) ->
    towEntity = _towEntity_

  it 'should do something', ->
    expect(!!towEntity).toBe true
