AngulaRails.config ($stateProvider, $urlRouterProvider) ->
  $urlRouterProvider.otherwise("/")

  $stateProvider
    .state('app',
      url: "/"
      templateUrl: "/assets/crew/index.html"
      controller: "CrewMembersController"
    )
    .state('app.crew',
      url: "crew/:id"
      templateUrl: "/assets/crew/show.html"
      controller: "CrewMemberController"
      resolve:
        position: ($q, $stateParams, $timeout, Crew) ->
          defer = $q.defer()
          $timeout () ->
            position = Crew.getPosition($stateParams.id)
            defer.resolve(position)
          , 1000

          defer.promise
    )
