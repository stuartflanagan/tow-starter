'use strict'

###*
 # @ngdoc service
 # @name towApp.towEntityResource
 # @description
 # # towEntityResource
 # Factory in the towApp.
###

angular.module('towApp')
  .factory 'towEntityResource', (towBaseResource)->
    class towEntityResource extends towBaseResource
      @