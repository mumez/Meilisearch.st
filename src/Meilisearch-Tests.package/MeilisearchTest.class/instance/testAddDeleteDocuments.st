tests
testAddDeleteDocuments
	| originalIndexes newIndexId index createIndexTask documents putDocumentsTask resp deleteDocumentsTask deleteIndexTask |
	originalIndexes := meilisearch indexes.
	newIndexId := 'mailisearch-st-test-documents-1'.
	createIndexTask := meilisearch createIndex: newIndexId.
	createIndexTask waitEndedForAWhile.
	self assert: createIndexTask isSucceeded.
	
	index := (meilisearch index: newIndexId).
	documents := self documentsJson.
		
	putDocumentsTask := index putDocuments: documents.
	putDocumentsTask waitEndedForAWhile.
	self assert: putDocumentsTask isSucceeded.
	
	resp := index getAllDocuments.
	self assert: resp total equals: documents size.
	
	deleteDocumentsTask := index deleteAllDocuments.
	deleteDocumentsTask waitEndedForAWhile.
	
	resp := index getAllDocuments.
	self assert: resp total equals: 0.
	
	deleteIndexTask := index delete.
	deleteIndexTask waitEndedForAWhile.
	self assert: deleteIndexTask isSucceeded.