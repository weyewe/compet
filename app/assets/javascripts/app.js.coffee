@app = angular.module("CompetApp", ['ngSanitize', 'ngResource'])


@app.config [
		'$routeProvider',
		($routeProvider) ->
			$routeProvider.when( '/competences', {templateUrl: 'views/competences/list.html', controller : 'CompetenceBuilder'})
			$routeProvider.when( '/competences/:id', {templateUrl : 'views/competences/list.html', controller  : 'CompetenceBuilder'})
			$routeProvider.when( '/competences/:id/materials/:id', {templateUrl: 'views/competences/list.html', controller : 'CompetenceBuilder'})
			$routeProvider.otherwise( {redirectTo : '/competences'})
	]
		
@app.config [
		'$httpProvider',
		($httpProvider) -> 
			$httpProvider.defaults.headers.common['X-CSRF-Token'] =  $('meta[name=csrf-token]').attr('content')
	]