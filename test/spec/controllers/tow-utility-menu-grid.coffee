'use strict'

describe 'Controller: TowUtilityMenuGridCtrl', ->

  # load the controller's module
  beforeEach module 'towApp'

  TowUtilityMenuGridCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    TowUtilityMenuGridCtrl = $controller 'TowUtilityMenuGridCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(scope.awesomeThings.length).toBe 3
