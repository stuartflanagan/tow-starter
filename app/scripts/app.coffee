'use strict'

###*
 # @ngdoc overview
 # @name towApp
 # @description
 # # towApp
 #
 # Main module of the application.
###
angular
  .module('towApp', [
    #Vendor
    'ngAnimate',
    'ngCookies',
    'ngResource',
    'ngRoute',
    'ngSanitize',
    'ngTouch',
    'ngMaterial',
    #Templates
    'tow.view.Templates',
    #Custom
    'tow.services.config',

  ])
  .config (
    #Vendor
    $routeProvider,
    $sceDelegateProvider,
    $compileProvider,
    $locationProvider,
    #Custom
    appConfiguration
    ) ->

    $locationProvider.html5Mode(true)

    console?.log "#{appConfiguration.site.environment}:#{appConfiguration.site.version}"

    resourceUrlWhitelist = appConfiguration.site.urlWhitelist or ['self']
    hrefSanitizationWhitelist = appConfiguration.site.hrefSanitizationWhitelist or /^\s*(https?|sms|tel|mailto):/

    $sceDelegateProvider.resourceUrlWhitelist(resourceUrlWhitelist);
    $compileProvider.aHrefSanitizationWhitelist(hrefSanitizationWhitelist)


    #Setup application routes from config    
    applicationRoutes = appConfiguration.site.applicationRoutes

    $routeProvider.when(route.path, route.options) for route in applicationRoutes

    #TODO output this from config
    $routeProvider
      .otherwise
        redirectTo: 'views/404.html'