angular.module('kyuMaruGram')
  .factory('User', [
    'localStorageService'
    (localStorageService) ->
      accessToken = null
      userData = null

      getAccessToken: () ->
        return accessToken or localStorageService.get('kyumaru-gram-accessToken')

      setAccessToken: (value) ->
        accessToken = value
        localStorageService.set('kyumaru-gram-accessToken', value)

      set: (data) ->
        userData = data

      get: () ->
        userData
  ])
