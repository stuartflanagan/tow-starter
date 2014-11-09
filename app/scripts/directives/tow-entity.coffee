'use strict'

###*
 # @ngdoc directive
 # @name towApp.directive:towEntity
 # @description
 # # towEntity
###
angular.module('towApp')
  .directive('towEntity', ($rootScope, $templateCache, appConfiguration) ->
    templateUrl: 'views/_/entity-container.html'
    restrict: 'CAE',
    scope: {
      item: '='
    },
    link: (scope, element, attrs) ->
      console.log "scope", scope.item
      pathSuffix = ""
      #type
      pathSuffix = "-#{scope.item.type}" if scope.item.type
      #context
      pathSuffix += "-#{attrs.itemContext}" if attrs.itemContext
      #override
      pathSuffix = "-#{attrs.context}" if attrs.context

      # Create template path
      path = "views/entities/entity#{pathSuffix}.html"
      
      #
      scope.path = if $templateCache.get(path) then path else "views/entities/entity.html" #relies on this fall back @todo put into config
  )
