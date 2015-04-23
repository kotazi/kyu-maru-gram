angular.module('kyuMaruGram')
  .factory('User', [
    () ->
      accessToken = null
      id = null
      userData = {}

      getAcceccToken: () ->
        # Tmp
        accessToken = '13712342.4183bc0.bca532b1eb264603b217822be720ed5e'
        return accessToken

      getId: () ->
        # Tmp
        id = '13712342'
        return id

      set: (data) ->
        userData = data
  ])
  