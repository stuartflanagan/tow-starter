'use strict'

###*
 # @ngdoc service
 # @name towApp.towBaseObject
 # @description
 # # towBaseObject
 # Factory in the towApp.
###
angular.module('towApp')
  .factory 'towBaseObject', ->
    class towBaseObject
      constructor: (initObject)->
        angular.extend(@, initObject)
        @