angular.module('ohshimagram', [
  'ngAnimate'
  'ngCookies'
  'ngTouch'
  'ngSanitize'
  'ngResource'
  'ui.router'
  'ui.bootstrap'
  'LocalStorageModule'
  'infinite-scroll'
  ])
  .config([
    '$stateProvider'
    '$urlRouterProvider'
    '$sceDelegateProvider'
    '$httpProvider'
    ($stateProvider, $urlRouterProvider, $sceDelegateProvider, $httpProvider) ->

      $stateProvider
        .state('home',
          url: '/'
          templateUrl: "app/main/main.html"
          controller: "MainCtrl"
        )
        .state('about',
          url: '/about'
          templateUrl: 'app/about/about.html'
        )
        .state('contact',
          url: '/contact'
          templateUrl: 'app/contact/contact.html'
        )
        .state('oauth',
          url: '/access_token=*path'
          templateUrl: 'app/main/main.html'
          controller: "MainCtrl"
        )

      $urlRouterProvider.otherwise '/'
  ])
