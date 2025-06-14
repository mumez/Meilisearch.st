tests
testFacetSearchDocuments
	self
		createIndexNamed: 'mailisearch-st-test-facet-search-1'
		then: [ :idx |
			| settingsTask |
			settingsTask := idx applySettingsUsing: [ :opts |
				                opts filterableAttributes:
					                #( 'title' 'genres' 'language' 'rating' ) ].
			settingsTask waitEndedForAWhile ]
		documents: self facetsDocumentsJson
		do: [ :index | | resp facetHits classics comedy childrensLiterature |
			resp := index facetSearchUsing: [ :opts |
				        opts
					        facetQuery: 'c';
					        facetName: 'genres';
					        filter: 'rating > 4.3' ].
			facetHits := resp facetHits.
			self assert: facetHits size equals: 3.
			classics := facetHits detect: [ :each |
				            (each at: 'value') = 'Classics' ].
			self assert: (classics at: 'count') equals: 7.
			comedy := facetHits detect: [ :each |
				          (each at: 'value') = 'Comedy' ].
			self assert: (comedy at: 'count') equals: 1.
			childrensLiterature := facetHits detect: [ :each |
				                       (each at: 'value') = 'Childrens Literature' ].
			self assert: (childrensLiterature at: 'count') equals: 2 ]