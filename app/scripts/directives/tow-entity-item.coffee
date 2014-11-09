'use strict'

###*
 # @ngdoc directive
 # @name towApp.directive:towEntityItem
 # @description
 # # towEntityItem
###
angular.module('towApp')
  .directive('towEntityItem', ($rootScope, $templateCache, appConfiguration) ->
    templateUrl: 'views/_/entity-item-container.html'
    restrict: 'CAE',
    scope: {
      item: '='
    },
    link: (scope, element, attrs) ->

      pathSuffix = ""
      #type
      pathSuffix = "-#{scope.item.type}" if scope.item.type
      #context
      pathSuffix += "-#{attrs.itemContext}" if attrs.itemContext
      #override
      pathSuffix = "-#{attrs.context}" if attrs.context

      # Create template path
      path = "views/entities/entity-item#{pathSuffix}.html"
      
      console.log path
      #
      scope.path = if $templateCache.get(path) then path else "views/entities/entity-item.html" #relies on this fall back @todo put into config
  )
