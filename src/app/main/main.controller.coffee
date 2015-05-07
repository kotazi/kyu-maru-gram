
angular.module('ohshimagram')
  .controller('MainCtrl', [
    '$scope'
    'api'
    'Items'
    'User'
    '$location'
    'Insta'
    '$modal'
    '$timeout'
    ($scope, api, Items, User, $location, Insta, $modal, $timeout) ->
      container = null
      iso = null

      $scope.hasAccessTokenInUrl = () ->
        return $location.path().match(/\/access_token=/)

      $scope.isSafari = ->
        ua = window.navigator.userAgent.toLowerCase()

        if ua.indexOf('chrome') != -1
          return false
        else if ua.indexOf('safari') != -1
          return true
        return false

      $scope.init = ->

        if $scope.hasAccessTokenInUrl()
          accessToken = $location.path().split(/\/access_token=/)[1]
          User.setAccessToken(accessToken)
          
        if !User.getAccessToken()
          # 単体テスト対策
          if $location.absUrl() == 'http://server/'
            # 何もしない
          else if $location.absUrl() == 'http://localhost:3000/index.html?proctor=true#/'
            # 何もしない

          else if $scope.isSafari()
            # 何もしない
          else
            location.href = "https://instagram.com/oauth/authorize/?client_id=#{Insta.clientId}&scope=basic+comments+relationships+likes&redirect_uri=#{Insta.redirectUrl}&response_type=token"
            return

        api.getSelfData().$promise.then((res) ->
          User.set(res.data)
          $scope.user = res.data
        )

        api.getKyumaruItems().$promise.then((res) ->

          Items.set(res.data)
          Items.setNextUrl(res.pagination)
          $scope.bricks = Items.get()
          $timeout ->

            container = $('.item_box')[0]
            options =
              itemSelector: '.item'
              columnWidth: 0
              isFitWidth: true
            iso = new Masonry(container,options)

        )

      $scope.open = (item) ->
        innerScope = $scope.$new(true)
        innerScope.item = item
        $modal.open(
          templateUrl: './app/modal/modalItem.html'
          controller: 'ModalCtrl'
          scope: innerScope
        )

      $scope.loadMore = () ->
        url = Items.getNextUrl()
        if !url
          return false
        if !Items.isFinishedLoading()
          return false
        if Items.loading
          return false

        Items.loading = true
        api.getKyumaruNexstItems(url).$promise.then((res) ->
          Items.loading = false
          Items.add(res.data)
          Items.setNextUrl(res.pagination)
          $scope.bricks = Items.get()
          iso.reloadItems()
          iso.layout()
        )

      $scope.init()

  ])
