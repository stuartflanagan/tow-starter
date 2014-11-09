'use strict'

describe 'Service: towBaseResource', ->

  # load the service's module
  beforeEach module 'towApp'

  # instantiate service
  towBaseResource = {}
  beforeEach inject (_towBaseResource_) ->
    towBaseResource = _towBaseResource_

  it 'should do something', ->
    expect(!!towBaseResource).toBe true
