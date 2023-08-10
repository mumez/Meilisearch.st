tests
testFacetSearchDocuments
	| originalIndexes newIndexId index settingsTask createIndexTask documents putDocumentsTask resp languageDistibution ratingStats deleteDocumentsTask deleteIndexTask |
	originalIndexes := meilisearch indexes.
	newIndexId := 'mailisearch-st-test-facet-search-1'.
	createIndexTask := meilisearch createIndex: newIndexId.
	createIndexTask waitEndedForAWhile.
	self assert: createIndexTask isSucceeded.
	
	index := (meilisearch index: newIndexId).
	settingsTask := index applySettingsUsing: [ :opts | 
		opts filterableAttributes: #('title' 'genres' 'language' 'rating').
	].
	settingsTask waitEndedForAWhile.
	documents := self facetsDocumentsJson.
	putDocumentsTask := index putDocuments: documents.
	putDocumentsTask waitEndedForAWhile.
	self assert: putDocumentsTask isSucceeded.
		
	resp := index search: 'classic' optionsUsing: [:opts | opts facets: #('genres' 'language' 'rating')].
	resp inspect.
	self assert: resp estimatedTotalHits equals: 10.
	self assert: (resp hits collect: [ :each | each at: 'id' ]) sorted equals: #(5 6 7 8 9 10 11 12 14 15).
	languageDistibution := resp facetDistribution at: 'language'.
	self assert: (languageDistibution at: 'English') equals: 9.
	self assert: (languageDistibution at: 'Russian') equals: 1.
	ratingStats := resp facetStats at: 'rating' ifAbsent: [Dictionary new].
	self assert: (ratingStats at: 'min') equals: 4.3.
	self assert: (ratingStats at: 'max') equals: 4.8.
	
	deleteDocumentsTask := index deleteAllDocuments.
	deleteDocumentsTask waitEndedForAWhile.
	
	resp := index getAllDocuments.
	self assert: resp total equals: 0.
	
	deleteIndexTask := index delete.
	deleteIndexTask waitEndedForAWhile.
	self assert: deleteIndexTask isSucceeded.