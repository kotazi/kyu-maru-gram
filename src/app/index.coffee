angular.module 'kyuMaruGram', ['ngAnimate', 'ngCookies', 'ngTouch', 'ngSanitize', 'ngResource', 'ui.router', 'ui.bootstrap']
  .config ($stateProvider, $urlRouterProvider) ->
    $stateProvider
      .state("home",
        url: "/"
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

    $urlRouterProvider.otherwise '/'

