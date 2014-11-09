'use strict'

###*
 # @ngdoc function
 # @name towApp.controller:MainCtrl
 # @description
 # # MainCtrl
 # Controller of the towApp
###
angular.module('towApp')
  .controller 'MainCtrl', ($scope) ->
    $scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]
