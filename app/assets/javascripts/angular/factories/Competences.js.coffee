@app.factory "Competences", [
		'$http',
		'$rootScope',
		($http, $rootScope) ->
			objects = {
				selected : null, 
				selectedIdx : null,
				all : [
						{
							id:1 ,
							title : 'Integrate Chrome with your iOS app',
							posted_at  : '13 hours ago',
							source : 'Chromium Blog',
							selected : false
						},
						{
							id:2 ,
							title : 'Integrate Chrome with your iOS app',
							posted_at  : '13 hours ago',
							source : 'Chromium Blog',
							selected : false
						},
						{
							id:3 ,
							title : 'Integrate Chrome with your iOS app',
							posted_at  : '13 hours ago',
							source : 'Chromium Blog',
							selected : false
						},
						{
							id:4,
							title : 'Integrate Chrome with your iOS app',
							posted_at  : '13 hours ago',
							source : 'Chromium Blog',
							selected : false
						},
						{
							id:5 ,
							title : 'Integrate Chrome with your iOS app',
							posted_at  : '13 hours ago',
							source : 'Chromium Blog',
							selected : false
						},
						{
							id:6,
							title : 'Integrate Chrome with your iOS app',
							posted_at  : '13 hours ago',
							source : 'Chromium Blog',
							selected : false
						},
						{
							id:7 ,
							title : 'Integrate Chrome with your iOS app',
							posted_at  : '13 hours ago',
							source : 'Chromium Blog',
							selected : false
						},
						{
							id:8 ,
							title : 'Integrate Chrome with your iOS app',
							posted_at  : '13 hours ago',
							source : 'Chromium Blog',
							selected : false
						},
						{
							id:9 ,
							title : 'Integrate Chrome with your iOS app',
							posted_at  : '13 hours ago',
							source : 'Chromium Blog',
							selected : false
						},
						{
							id:10 ,
							title : 'Integrate Chrome with your iOS app',
							posted_at  : '13 hours ago',
							source : 'Chromium Blog',
							selected : false
						},
						{
							id:11 ,
							title : 'Integrate Chrome with your iOS app',
							posted_at  : '13 hours ago',
							source : 'Chromium Blog',
							selected : false
						},
						{
							id:12 ,
							title : 'Integrate Chrome with your iOS app',
							posted_at  : '13 hours ago',
							source : 'Chromium Blog',
							selected : false
						}
					]
	
			 
				selectObject: (object) ->
					if objects.selected
						objects.selected.selected  = false 

					objects.selected = object
					objects.selectedIdx = objects.all.indexOf( object )  
					objects.selected.selected = true
					$rootScope.$broadcast('Competences:selectionChange');
				
			}
			
			
				
			objects
	]