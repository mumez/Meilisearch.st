tests
testFacetSearchDocuments
	| originalIndexes newIndexId index settingsTask createIndexTask documents putDocumentsTask resp facetHits classics comedy childrensLiterature deleteDocumentsTask deleteIndexTask |
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
	
	resp := index facetSearchUsing: [:opts | opts facetQuery: 'c'; facetName: 'genres'; filter: 'rating > 4.3'].
	facetHits := resp facetHits.
	self assert: (facetHits size) equals: 3.
	classics := facetHits detect: [ :each | (each at: 'value') = 'Classics'].
	self assert: (classics at: 'count') equals: 7.
	comedy := facetHits detect: [ :each | (each at: 'value') = 'Comedy'].
	self assert: (comedy at: 'count') equals: 1.
	childrensLiterature := facetHits detect: [ :each | (each at: 'value') = 'Children''s Literature'].
	self assert: (childrensLiterature at: 'count') equals: 2.
	
	deleteDocumentsTask := index deleteAllDocuments.
	deleteDocumentsTask waitEndedForAWhile.
	
	resp := index getAllDocuments.
	self assert: resp total equals: 0.
	
	deleteIndexTask := index delete.
	deleteIndexTask waitEndedForAWhile.
	self assert: deleteIndexTask isSucceeded.