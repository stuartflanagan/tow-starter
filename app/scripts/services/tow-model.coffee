'use strict'

###*
 # @ngdoc service
 # @name towApp.towModel
 # @description
 # # towModel
 # Service in the towApp.
###
angular.module('towApp')
  .service 'towModel', (appConfiguration)->
    getEntity = (id)->
      entity = _.where towModel.model, { 'url': id }
      entity[0]

    filter = (id)->
      entity = _.where towModel.model, { 'url': id }
      entity[0]

    towModel = 
      model: []
      getEntity: getEntity

#      currentModel: {}
#      addModel: (id, model) ->
#        models[id] = model
#        @
#      getModel: (id) ->
#        return models[0] || null
#        @
#      setModel: (id) ->
#        currentModel = models[id]
#        @
#    # AngularJS will instantiate a singleton by calling "new" on this function
