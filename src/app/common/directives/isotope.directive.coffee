
angular.module('kyuMaruGram')
  .directive('isotope', ($timeout)->
    controller: ($scope) ->
    link: (scope, elem, attrs) ->
      container = elem[0]
      options =
        itemSelector: '.item'
        columnWidth: 200
        gutter: 10

      $timeout ->
        scope.isotope = new Isotope(container,options)

  )
    