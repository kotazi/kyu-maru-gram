'use strict'

describe 'controllers', ->
  scope = undefined
  beforeEach module('kyuMaruGram')
  beforeEach inject(($rootScope, $location) ->
    scope = $rootScope.$new()
    return
  )

  it 'First Test.', inject(($controller) ->
    $controller 'MainCtrl', $scope: scope
    return
  )

  it 'should return true, when there is access token in url', inject(($controller, $location) ->
    $controller 'MainCtrl', $scope: scope
    $location.path('/access_token=')
    expect(scope.hasAccessTokenInUrl()).toBeTruthy()
  )
  return
