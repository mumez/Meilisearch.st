tests
testSearchDocumentsWithOptions
	| originalIndexes newIndexId index settingsTask createIndexTask documents putDocumentsTask resp deleteDocumentsTask deleteIndexTask |
	originalIndexes := meilisearch indexes.
	newIndexId := 'mailisearch-st-test-search-2'.
	createIndexTask := meilisearch createIndex: newIndexId.
	createIndexTask waitEndedForAWhile.
	self assert: createIndexTask isSucceeded.
	
	index := (meilisearch index: newIndexId).
	settingsTask := index applySettingsUsing: [ :opts | 
		opts sortableAttributes: #('id' 'title'); filterableAttributes: #('id' 'title').
	].
	settingsTask waitEndedForAWhile.
	documents := self documentsJson.
	putDocumentsTask := index putDocuments: documents.
	putDocumentsTask waitEndedForAWhile.
	self assert: putDocumentsTask isSucceeded.
	documents := self sortableDocumentsJson .
	putDocumentsTask := index putDocuments: documents.
	putDocumentsTask waitEndedForAWhile.
	self assert: putDocumentsTask isSucceeded.
		
	resp := index search: 'Smalltalk' optionsUsing: [:opts | opts sort: #('id:desc')].
	self assert: resp estimatedTotalHits equals: 2.
	self assert: (resp hits collect: [ :each | each at: 'id' ]) equals: #(100 10).
	
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