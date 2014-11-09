'use strict'

describe 'Directive: towEntityItem', ->

  # load the directive's module
  beforeEach module 'towApp'

  scope = {}

  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()

  it 'should make hidden element visible', inject ($compile) ->
    element = angular.element '<tow-entity-item></tow-entity-item>'
    element = $compile(element) scope
    expect(element.text()).toBe 'this is the towEntityItem directive'
