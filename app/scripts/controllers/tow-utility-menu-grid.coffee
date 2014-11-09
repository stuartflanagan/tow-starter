'use strict'

###*
 # @ngdoc function
 # @name towApp.controller:TowUtilityMenuGridCtrl
 # @description
 # # TowUtilityMenuGridCtrl
 # Controller of the towApp
###
angular.module('towApp')
  .controller("TowUtilityMenuGridCtrl", ($scope, $mdBottomSheet) ->
    $scope.items = [
      {
        name: "Hangout"
        icon: "hangout"
      }
      {
        name: "Mail"
        icon: "mail"
      }
      {
        name: "Message"
        icon: "message"
      }
      {
        name: "Copy"
        icon: "copy"
      }
      {
        name: "Facebook"
        icon: "facebook"
      }
      {
        name: "Twitter"
        icon: "twitter"
      }
    ]
    $scope.listItemClick = ($index) ->
      clickedItem = $scope.items[$index]
      $mdBottomSheet.hide clickedItem
      return

    return
  )