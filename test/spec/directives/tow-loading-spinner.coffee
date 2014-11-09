'use strict'

describe 'Directive: towLoadingSpinner', ->

  # load the directive's module
  beforeEach module 'towApp'

  scope = {}

  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()

  it 'should make hidden element visible', inject ($compile) ->
    element = angular.element '<tow-loading-spinner></tow-loading-spinner>'
    element = $compile(element) scope
    expect(element.text()).toBe 'this is the towLoadingSpinner directive'
