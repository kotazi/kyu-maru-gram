angular.module('kyuMaruGram')
  .factory('Items', [
    () ->
      items = null

      set: (data) ->
        items = data

      get: () ->
        items
  ])
