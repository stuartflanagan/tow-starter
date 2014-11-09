'use strict'

###*
 # @ngdoc function
 # @name towApp.controller:TowEntityCtrl
 # @description
 # # TowEntityCtrl
 # Controller of the towApp
###
angular.module('towApp')
  .controller 'TowEntityCtrl', ($scope, $routeParams, towEntityResource, towModel, appConfiguration) ->

    resourceSuccess = (entity)->
      $scope.isLoading = false
      $scope.item = entity
      $scope.path = "views/entities/entity-container.html"
      @

    resourceError = ()->
      $scope.isLoading = false
      $scope.path = "views/404.html"
      @

    # serviceEndpoint = "#{appConfiguration.site.apis.content.base}#{appConfiguration.site.apis.content.endpoints.content}"
    
    $scope.isLoading = true
    id = $routeParams.path
    #if entity = towModel.getEntity id
    #  resourceSuccess entity
    #else

    # {path:id}
    # issue with ng removing forward slashes
    #serviceEndpoint = "#{appConfiguration.site.apis.content.base}#{appConfiguration.site.apis.content.endpoints.content}"
    entityResource = new towEntityResource("#{appConfiguration.site.apis.content.base}#{$routeParams.path}")
    entity = entityResource.get()

    #entityResource = new towEntityResource("#{appConfiguration.site.apis.content.base}#{$routeParams.path}")
    #entity = entityResource.get()

    entity.$promise.then (data)->
      resourceSuccess data
    ,(error)->
      resourceError()
