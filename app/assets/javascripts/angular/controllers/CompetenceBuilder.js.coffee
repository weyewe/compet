
@app.controller "CompetenceBuilder", [
		'$scope',
		'$routeParams',
		'$location',
		'Competences',
		'Materials',
		($scope, $routeParams, $location, Competences, Materials) ->
			
			$scope.competences = Competences
			$scope.selectedCompetence = null
			$scope.materials = Materials 
			$scope.competenceMaterials = [] 
			$scope.selectedMaterial	= null 
			
	 
			
			$scope.$on 'Competences:selectionChange' , ->
				console.log "Competences:selectionChange"
				$scope.selectedCompetence = Competences.selected
				Materials.filterByCompetenceId $scope.selectedCompetence.id
				$scope.competenceMaterials = Materials.competenceMaterials
				if $scope.competenceMaterials.length != 0 
					Materials.selectObject( $scope.competenceMaterials[0])
			
			$scope.$on 'Materials:selectionChange' , ->
				console.log "Materials:selectionChange"
				$scope.selectedMaterial = Materials.selected 
				console.log("The selected Material: ")
				console.log( "#{$scope.selectedMaterial}")
		
				
			$scope.selectObjectByIndex = (index) ->
				object = Competences.all[index]
				Competences.selectObject( object ) 
				
			$scope.selectMaterial = (object) ->
				Materials.selectObject object
				
			$scope.urlEncode = (target) ->
				 encodeURIComponent(target);
				
			$scope.materialType = (material) ->
				material.file_type
		
			autoSelectCompetence = ->
				Competences.selectObject( Competences.all[0] )
				
			autoSelectCompetence() 
			
			
	]
 