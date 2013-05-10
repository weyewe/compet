@app.factory "Materials", [
		'$http',
		'$rootScope',
		'filterFilter',
		($http, $rootScope, filter) ->
			objects = {
				selected : null, 
				selectedIdx : null,
				
				competenceMaterials : [],
				
				
			 
				
				all : [
						{
							competence_id:1 ,
							id: 1,
							title : '1 2Integrate Chrome with your iOS app',
							posted_at  : '13 hours ago',
							source : 'Chromium Blog',
							storage_url : 'http://research.google.com/archive/bigtable-osdi06.pdf',
							file_type : 'goog',
							selected : false
						},
						{
							competence_id:2 ,
							id: 2,
							title : '2 Integrate Chrome with your iOS app',
							posted_at  : '13 hours ago',
							source : 'Chromium Blog',
							
							storage_url : 'https://s3.amazonaws.com/compet/Module+5.ppt',
							file_type : 'ms',
							selected : false
						},
						{
							competence_id:3 ,
							id: 3,
							title : '3 Integrate Chrome with your iOS app',
							posted_at  : '13 hours ago',
							source : 'Chromium Blog',
							
							storage_url : 'https://s3.amazonaws.com/compet/SIKKIupdate2.docx',
							file_type : 'ms',
							selected : false
						},
						{
							competence_id:1,
							id: 4,
							title : '4 IMG',
							posted_at  : '13 hours ago',
							source : 'Chromium Blog',
							storage_url : 'https://s3.amazonaws.com/compet/footer(new).jpg',
							file_type : 'img',
							selected : false
						},
						{
							competence_id:1 ,
							id: 5,
							title : '5 Integrate Chrome with your iOS app',
							posted_at  : '13 hours ago',
							source : 'Chromium Blog',
							storage_url : 'https://s3.amazonaws.com/compet/BIGSALEUP502-PIC.xls',
							file_type : 'ms',
							selected : false
						},
						{
							competence_id:2,
							id: 6,
							title : '6 Kitano Chrome with your iOS app',
							posted_at  : '13 hours ago',
							source : 'Chromium Blog',
							storage_url : 'https://s3.amazonaws.com/compet/kitano_new.jpg',
							file_type : 'img',
							selected : false
						},
						{
							competence_id:3 ,
							id: 7,
							title : '7 Integrate Chrome with your iOS app',
							posted_at  : '13 hours ago',
							source : 'Chromium Blog',
							storage_url : 'https://s3.amazonaws.com/compet/SIKKIupdate2.docx',
							file_type : 'ms',
							selected : false
						},
						{
							competence_id:1 ,
							id: 8,
							title : '8 Integrate Chrome with your iOS app',
							posted_at  : '13 hours ago',
							source : 'Chromium Blog',
							storage_url : 'https://s3.amazonaws.com/compet/conten+web.docx',
							file_type : 'ms',
							selected : false
						},
						{
							competence_id:2 ,
							id: 9,
							title : '9 Integrate Chrome with your iOS app',
							posted_at  : '13 hours ago',
							source : 'Chromium Blog',
							storage_url : 'https://s3.amazonaws.com/compet/BIGSALEUP502-PIC.xls',
							file_type : 'ms',
							selected : false
						},
						{
							competence_id:1 ,
							id: 10,
							title : '10 Integrate Chrome with your iOS app',
							posted_at  : '13 hours ago',
							source : 'Chromium Blog',
							storage_url : 'https://s3.amazonaws.com/compet/SIKKIupdate2.docx',
							file_type : 'ms',
							selected : false
						},
						{
							competence_id:1 ,
							id: 11,
							title : '11 Integrate Chrome with your iOS app',
							posted_at  : '13 hours ago',
							source : 'Chromium Blog',
							storage_url : 'https://s3.amazonaws.com/compet/BIGSALEUP502-PIC.xls',
							file_type : 'ms',
							selected : false
						},
						{
							competence_id:3 ,
							id: 12,
							title : '12 Integrate Chrome with your iOS app',
							posted_at  : '13 hours ago',
							source : 'Chromium Blog',
							storage_url : 'https://s3.amazonaws.com/compet/SIKKIupdate2.docx',
							file_type : 'ms',
							selected : false
						}
					]
	
			 
				selectObject: (object) ->
					if objects.selected
						objects.selected.selected  = false 

					objects.selected = object
					objects.selectedIdx = objects.all.indexOf( object )  
					console.log("Object.selected title: #{objects.selected.title}")
					objects.selected.selected = true
					
					$rootScope.$broadcast('Materials:selectionChange');
					
				filterByCompetenceId: (competenceId) ->  
					objects.competenceMaterials = []
					
					angular.forEach objects.all, (object) ->
						if object.competence_id == competenceId 
							objects.competenceMaterials.push object 
					
					
				
			}
			
			
				
			objects
	]