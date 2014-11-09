'use strict'

describe 'Controller: TowUtilityMenuCtrl', ->

  # load the controller's module
  beforeEach module 'towApp'

  TowUtilityMenuCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    TowUtilityMenuCtrl = $controller 'TowUtilityMenuCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(scope.awesomeThings.length).toBe 3
