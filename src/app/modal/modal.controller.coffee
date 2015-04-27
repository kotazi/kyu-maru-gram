angular.module('kyuMaruGram')
  .controller('ModalCtrl', [
    '$scope'
    'api'
    '$modalInstance'
    ($scope, api, $modalInstance) ->
      $scope.comment = (text) ->
        api.postComment(this.item.id, text).$promise.then((res) ->
        )
      $scope.close = () ->
        $modalInstance.dismiss('cancel')
  ])
  