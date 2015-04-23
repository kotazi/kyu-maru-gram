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
                access_token: User.getAcceccToken()
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
        resource.query().$promise

      getUserData: () ->
        resource = $resource('https://api.instagram.com/v1/users/:id/',
          {
            id: User.getId()
            callback: "JSON_CALLBACK"
          },
          {
            query:
              method: 'JSONP'
              params:
                access_token: User.getAcceccToken()
          }
        )
        resource.query().$promise
  ])
