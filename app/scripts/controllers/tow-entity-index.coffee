'use strict'

###*
 # @ngdoc function
 # @name towApp.controller:TowEntityIndexCtrl
 # @TowEntityIndexCtrl
 # # TowEntityIndexCtrl
 # Controller of the towApp
###
angular.module('towApp')
  .controller 'TowEntityIndexCtrl', ($scope, $location, towModel, towEntityResource, appConfiguration) ->
    entityResource = {}
    $scope.init = (@itemsPerPage=appConfiguration.site.indexPageLimit, @defaultQuery={})->
      @cursor               = 0
      $scope.currentEntity  = null
      $scope.cursor = 0
      $scope.query = {}

      $scope.query.limit = @itemsPerPage
      $scope.query.offset = 0

      $scope.isLoading = false
      $scope.moreToLoad = false
      
      $scope.path = "entity-item-wrapper.html"

      serviceEndpoint = "#{appConfiguration.site.apis.content.base}#{appConfiguration.site.apis.content.endpoints.content}"
      entityResource = new towEntityResource(serviceEndpoint)

      doQuery()
      @

    $scope.loadMore = ()->

      $scope.query.offset = $scope.cursor #@itemsPerPage*
      console.log $scope.query.offset
      doQuery(false)
      @

    doQuery = (reset=true)->
      $scope.items = [] if reset

      $scope.isLoading = true
      $scope.moreToLoad = false
      $scope.query = _.merge($scope.query, $location.search())
      $scope.query.path = 'entity'

      entities = entityResource.query($scope.query)
      
      entities.$promise.then (data)->
        $scope.show = true
        $scope.isLoading = false
        $scope.cursor++ if data.length > 0
        $scope.moreToLoad = !(data.length < 9)
        angular.forEach data, (value, key)->
          $scope.items.push value
        # hack for stu
        # towModel.model = $scope.items
        @
      @

