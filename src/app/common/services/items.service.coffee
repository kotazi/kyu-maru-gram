angular.module('ohshimagram')
  .factory('Items', [
    () ->
      items = null
      nextUrl = null
      nextId = null
      lastId = null

      set: (data) ->
        items = data

      get: () ->
        items

      add: (data) ->
        items = items.concat(data)

      setNextUrl: (pagination) ->
        lastId = nextId
        nextId = pagination.next_max_tag_id
        nextUrl = pagination.next_url

      getNextUrl: () ->
        nextUrl

      loading : false

      isFinishedLoading: () ->
        return lastId != nextId
  ])
