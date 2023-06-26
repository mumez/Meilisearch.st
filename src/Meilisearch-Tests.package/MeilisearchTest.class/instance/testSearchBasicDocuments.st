tests
testSearchBasicDocuments
	| originalIndexes newIndexId index createIndexTask documents putDocumentsTask resp deleteDocumentsTask deleteIndexTask |
	originalIndexes := meilisearch indexes.
	newIndexId := 'mailisearch-st-test-search-1'.
	createIndexTask := meilisearch createIndex: newIndexId.
	self waitABit.
	self assert: createIndexTask checkStatus isSucceeded.
	
	index := (meilisearch index: newIndexId).
	documents := self documentsJson.
		
	putDocumentsTask := index putDocuments: documents.
	self waitABit.
	self assert: putDocumentsTask checkStatus isSucceeded.
	
	resp := index search: 'Healthy'.
	self assert: resp estimatedTotalHits equals: 1.
	self assert: (resp hits first at: 'id') equals: 3.
	
	resp := index search: 'Future'.
	self assert: resp estimatedTotalHits equals: 2.
	self assert: (resp hits collect: [ :each | each at: 'id' ]) sort equals: #(1 2).
	
	resp := index search: 'AI'.
	self assert: resp estimatedTotalHits equals: 3.
	self assert: (resp hits collect: [ :each | each at: 'id' ]) sort equals: #(1 2 4).
	
	resp := index search: 'xyzzy'.
	self assert: resp estimatedTotalHits equals: 0.
	
	deleteDocumentsTask := index deleteAllDocuments.
	self waitABit.
	
	resp := index getAllDocuments.
	self assert: resp total equals: 0.
	
	deleteIndexTask := index delete.
	self waitABit.
	self assert: deleteIndexTask checkStatus isSucceeded.