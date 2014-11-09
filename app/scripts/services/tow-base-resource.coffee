'use strict'

###*
 # @ngdoc service
 # @name towApp.towBaseResource
 # @description
 # # towBaseResource
 # Factory in the towApp.
###
angular.module('towApp')
  .factory 'towBaseResource', ($resource)->
    class towBaseResource
      constructor: (serviceEndpoint, customActions={})->
        angular.extend(@, $resource("#{serviceEndpoint}.:format", {format:"json"}, customActions))
        @