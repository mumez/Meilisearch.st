tests
testAddDeleteDocuments
	| originalIndexes newIndexId index createIndexTask documents putDocumentsTask resp deleteDocumentsTask deleteIndexTask |
	originalIndexes := meilisearch indexes.
	newIndexId := 'mailisearch-st-test-documents-1'.
	createIndexTask := meilisearch createIndex: newIndexId.
	self waitABit.
	self assert: createIndexTask checkStatus isSucceeded.
	
	index := (meilisearch index: newIndexId).
	documents := self documentsJson.
		
	putDocumentsTask := index putDocuments: documents.
	self waitABit.
	self assert: putDocumentsTask checkStatus isSucceeded.
	
	resp := index getAllDocuments.
	self assert: resp total equals: documents size.
	
	deleteDocumentsTask := index deleteAllDocuments.
	self waitABit.
	
	resp := index getAllDocuments.
	self assert: resp total equals: 0.
	
	deleteIndexTask := index delete.
	self waitABit.
	self assert: deleteIndexTask checkStatus isSucceeded.