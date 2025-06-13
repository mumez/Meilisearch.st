tests
testSearchDocumentsWithFacets
	self
		createIndexNamed: 'mailisearch-st-test-search-with-facets-1'
		then: [ :index |
			| settingsTask |
			settingsTask := index applySettingsUsing: [ :opts |
				                opts filterableAttributes:
					                #( 'title' 'genres' 'language' 'rating' ) ].
			settingsTask waitEndedForAWhile ]
		documents: self facetsDocumentsJson
		do: [ :index |
			| resp languageDistibution ratingStats |
			resp := index
				        search: 'classic'
				        optionsUsing: [ :opts |
				        opts facets: #( 'genres' 'language' 'rating' ) ].
			self assert: resp estimatedTotalHits equals: 10.
			self
				assert: (resp hits collect: [ :each | each at: 'id' ]) sorted
				equals: #( 5 6 7 8 9 10 11 12 14 15 ).
			languageDistibution := resp facetDistribution at: 'language'.
			self assert: (languageDistibution at: 'English') equals: 9.
			self assert: (languageDistibution at: 'Russian') equals: 1.
			ratingStats := resp facetStats
				               at: 'rating'
				               ifAbsent: [ Dictionary new ].
			self assert: (ratingStats at: 'min') equals: 4.3.
			self assert: (ratingStats at: 'max') equals: 4.8 ]