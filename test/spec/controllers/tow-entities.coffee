'use strict'

describe 'Controller: TowEntitiesCtrl', ->

  # load the controller's module
  beforeEach module 'towApp'

  TowEntitiesCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    TowEntitiesCtrl = $controller 'TowEntitiesCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(scope.awesomeThings.length).toBe 3
