AngulaRails.directive "arPaging", () ->
  templateUrl: "/assets/paging.html"
  scope:
    currentPage: "=arCurrentPage"
    paging: "=arPaging"
    pagingChange: "=arPagingChange"
  controller: ($scope) ->
    $scope.$watch "paging", () ->
      if $scope.paging?
        $scope.pages = [1..$scope.paging.number_of_pages]

    $scope.$watch "currentPage", () ->
      $scope.pagingChange()

    $scope.setPage = (newPage) ->
      newPage = 1 if newPage < 1
      $scope.currentPage = newPage
