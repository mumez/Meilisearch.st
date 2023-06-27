tests
testSearchDocumentsWithOptions
	| originalIndexes newIndexId index attribs settingsTask createIndexTask documents putDocumentsTask resp deleteDocumentsTask deleteIndexTask |
	originalIndexes := meilisearch indexes.
	newIndexId := 'mailisearch-st-test-search-2'.
	createIndexTask := meilisearch createIndex: newIndexId.
	createIndexTask waitEndedForAWhile.
	self assert: createIndexTask isSucceeded.
	
	index := (meilisearch index: newIndexId).
	attribs := #('id' 'title').
	settingsTask := index applySettingsUsing: [ :opts | 
		opts sortableAttributes: attribs; filterableAttributes: attribs.
	].
	settingsTask waitEndedForAWhile.
	documents := self documentsJson.
		
	putDocumentsTask := index putDocuments: documents.
	putDocumentsTask waitEndedForAWhile.
	self assert: putDocumentsTask isSucceeded.
		
	resp := index search: 'Future' optionsUsing: [:opts | opts sort: #('id:desc')].
	self assert: resp estimatedTotalHits equals: 2.
	self assert: (resp hits collect: [ :each | each at: 'id' ]) equals: #(2 1).
	
	resp := index search: 'AI' optionsUsing:[:opts | opts filter: 'title = "The Internet and AI"'].
	self assert: resp estimatedTotalHits equals: 1.
	self assert: (resp hits collect: [ :each | each at: 'id' ]) equals: #(4).
	
	deleteDocumentsTask := index deleteAllDocuments.
	deleteDocumentsTask waitEndedForAWhile.
	
	resp := index getAllDocuments.
	self assert: resp total equals: 0.
	
	deleteIndexTask := index delete.
	deleteIndexTask waitEndedForAWhile.
	self assert: deleteIndexTask isSucceeded.