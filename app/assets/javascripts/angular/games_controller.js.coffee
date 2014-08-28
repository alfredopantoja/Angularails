AngulaRails.controller "GamesController", ($http, $scope) ->

  $scope.init = () ->
    $scope.currentPage = 1
    $scope.getGames()

  $scope.getGames = () ->
    http =
      method: "GET"
      url: "/games"
      params:
        page: $scope.currentPage

    $http(http)
      .success (response) ->
        $scope.games = response.games
        $scope.paging = response.meta
