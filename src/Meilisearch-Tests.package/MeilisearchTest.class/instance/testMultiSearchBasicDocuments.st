tests
testMultiSearchBasicDocuments
	| originalIndexes createIndexTask newIndexId1 newIndexId2 index1 index2 documents1 documents2 putDocumentsTask deleteDocumentsTask resp deleteIndexTask |
	originalIndexes := meilisearch indexes.
	newIndexId1 := 'mailisearch-st-test-multi-search-1'.
	createIndexTask := meilisearch createIndex: newIndexId1.
	createIndexTask waitEndedForAWhile.
	self assert: createIndexTask isSucceeded.
	newIndexId2 := 'mailisearch-st-test-multi-search-2'.
	createIndexTask := meilisearch createIndex: newIndexId2.
	createIndexTask waitEndedForAWhile.
	self assert: createIndexTask isSucceeded.
	
	index1 := (meilisearch index: newIndexId1).
	index2 := (meilisearch index: newIndexId2).
	documents1 := self documentsJson.
	documents2 := (self documentsJson asOrderedCollection add: (self extraDocumentJson); yourself) asArray.
		
	putDocumentsTask := index1 putDocuments: documents1.
	putDocumentsTask waitEndedForAWhile.
	self assert: putDocumentsTask isSucceeded.
	putDocumentsTask := index2 putDocuments: documents2.
	putDocumentsTask waitEndedForAWhile.
	self assert: putDocumentsTask isSucceeded.
	
	resp := meilisearch multiSearchUsing: [ :opts | {
		(opts index: index1) q: 'Healthy'.
		(opts index: index2) q: 'Healthy'.
	}].
	self assert: resp first estimatedTotalHits equals: 1.
	self assert: (resp first hits first at: 'id') equals: 3.
	self assert: resp second estimatedTotalHits equals: 2.
	self assert: (resp second hits collect: [ :each | each at: 'id' ]) sort equals: #(3 6).
	
	deleteDocumentsTask := index1 deleteAllDocuments.
	deleteDocumentsTask waitEndedForAWhile.
	resp := index1 getAllDocuments.
	self assert: resp total equals: 0.
	deleteDocumentsTask := index2 deleteAllDocuments.
	deleteDocumentsTask waitEndedForAWhile.
	resp := index2 getAllDocuments.
	self assert: resp total equals: 0.
	
	deleteIndexTask := index1 delete.
	deleteIndexTask waitEndedForAWhile.
	self assert: deleteIndexTask isSucceeded.
	deleteIndexTask := index2 delete.
	deleteIndexTask waitEndedForAWhile.
	self assert: deleteIndexTask isSucceeded.