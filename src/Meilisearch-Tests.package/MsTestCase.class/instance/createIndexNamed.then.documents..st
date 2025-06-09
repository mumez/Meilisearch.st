tests - common
createIndexNamed: newIndexId then: aBlock documents: documents
	| createIndexTask index putDocumentsTask |
	createIndexTask := meilisearch createIndex: newIndexId.
	createIndexTask waitEndedForAWhile.
	self assert: createIndexTask isSucceeded.
	index := meilisearch index: newIndexId.
	aBlock value: index.
	putDocumentsTask := index putDocuments: documents.
	putDocumentsTask waitEndedForAWhile.
	self assert: putDocumentsTask isSucceeded.
	^ index