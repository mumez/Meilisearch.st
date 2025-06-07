tests
testOffsetPaginator
	| originalIndexes newIndexId index createIndexTask documents putDocumentsTask paginator responses paginator2 responses2 resp deleteDocumentsTask deleteIndexTask |
	originalIndexes := meilisearch indexes.
	newIndexId := 'mailisearch-st-test-offset-paginator-1'.
	createIndexTask := meilisearch createIndex: newIndexId.
	createIndexTask waitEndedForAWhile.
	self assert: createIndexTask isSucceeded.
	
	index := (meilisearch index: newIndexId).
	documents := self documentsJson.
		
	putDocumentsTask := index putDocuments: documents.
	putDocumentsTask waitEndedForAWhile.
	self assert: putDocumentsTask isSucceeded.
	
	paginator := index offsetPaginator.
	paginator search: 'English'; limit: 5.
	
	responses := OrderedCollection new.
	[ paginator atEnd ] whileFalse: [ 
		responses add: paginator next.
	].
	self assert: responses size equals: 7.
	self assert: (responses at: 1) hits size equals: 5.
	self assert: (responses at: 2) hits size equals: 5.
	self assert: (responses at: 3) hits size equals: 5.
	self assert: (responses at: 4) hits size equals: 5.
	self assert: (responses at: 5) hits size equals: 5.
	self assert: (responses at: 6) hits size equals: 4.
	self assert: (responses at: 7) hits size equals: 0.
	
	paginator2 := index offsetPaginator.
	paginator2 search: 'English'; offset: 17; limit: 6.
	responses2 := OrderedCollection new.
	[ paginator2 atEnd ] whileFalse: [ 
		responses2 add: paginator2 next.
	].
	self assert: responses2 size equals: 3.
	self assert: (responses2 at: 1) hits size equals: 6.
	self assert: (responses2 at: 2) hits size equals: 6.
	self assert: (responses2 at: 3) hits size equals: 0.
	
	deleteDocumentsTask := index deleteAllDocuments.
	deleteDocumentsTask waitEndedForAWhile.
	
	resp := index getAllDocuments.
	self assert: resp total equals: 0.
	
	deleteIndexTask := index delete.
	deleteIndexTask waitEndedForAWhile.
	self assert: deleteIndexTask isSucceeded.