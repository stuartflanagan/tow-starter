'use strict'

###*
 # @ngdoc directive
 # @name towApp.directive:towLoadingSpinner
 # @description
 # # towLoadingSpinner
 # requires Spinner
###
angular.module('towApp')
  .directive('towLoadingSpinner', ->
    restrict: 'AE'
    link: (scope, element, attrs) ->

      spinner = new Spinner()

      scope.$watch attrs.watch, (newValue, oldValue)=>        
        if newValue
          spinner = new Spinner().spin(element[0])
        else
          spinner?.stop?()
        return

  )
