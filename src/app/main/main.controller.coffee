angular.module "kyuMaruGram"
  .controller "MainCtrl", ($scope) ->
    $scope.bricks = [
      {src: 'assets/images/browsersync.png'},
      {src: 'assets/images/browsersync.png'},
      {src: 'assets/images/browsersync.png'},
      {src: 'assets/images/browsersync.png'},
      {src: 'assets/images/browsersync.png'}
    ]

    angular.forEach $scope.awesomeThings, (awesomeThing) ->
      awesomeThing.rank = Math.random()
