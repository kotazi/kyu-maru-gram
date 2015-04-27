angular.module('kyuMaruGram')
  .factory('api', [
    '$resource'
    'Insta'
    'User'
    ($resource, Insta, User)->
      getPopularItems: () ->
        resource = $resource('https://api.instagram.com/v1/media/popular',
          {
            callback: "JSON_CALLBACK"
          },
          {
            query:
              method: 'JSONP'
              params:
                access_token: User.getAccessToken()
          }
        )
        resource.query().$promise

      getKyumaruItems: () ->
        resource = $resource('https://api.instagram.com/v1/tags/:tagId/media/recent',
          {
            tagId: 'きゅーまる'
            callback: "JSON_CALLBACK"
          },
          {
            query:
              method: 'JSONP'
              params:
                client_id: Insta.clientId
          }
        )
        resource.query()

      getKyumaruNexstItems: (url) ->
        # TODO: more smart
        resource = $resource(url,
          {
            callback: "JSON_CALLBACK"
          },
          {
            query:
              method: 'JSONP'
          }
        )
        resource.query()

      getSelfData: () ->
        resource = $resource('https://api.instagram.com/v1/users/self/',
          {
            callback: "JSON_CALLBACK"
          },
          {
            query:
              method: 'JSONP'
              params:
                access_token: User.getAccessToken()
          }
        )
        resource.query()

      # TODO: We can not use in client side
      postComment: (id, text) ->
        resource = $resource('https://api.instagram.com/v1/media/:mediaId/comments',
          {
            mediaId: id
            callback: "JSON_CALLBACK"
          },
          {
            save:
              method: 'POST'
              params:
                access_token: User.getAccessToken()
                text:text
          }
        )
        resource.save()
  ])
