'use strict'

###*
 # @ngdoc function
 # @name towApp.controller:TowUtilityMenuCtrl
 # @description
 # # TowUtilityMenuCtrl
 # Controller of the towApp
###
angular.module('towApp')
  .controller("TowUtilityMenuCtrl", ($scope, $timeout, $mdBottomSheet) ->
    $scope.alert = ""
    
    $scope.showUtilityMenu = ($event) ->
      $mdBottomSheet.show(
        templateUrl: "views/directives/tow-utility-menu.html"
        controller: "TowUtilityMenuGridCtrl"
        targetEvent: $event
      ).then (clickedItem) ->
        $scope.alert = clickedItem.name + " clicked!"
        return

      return

    return
  )