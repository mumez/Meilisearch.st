tests - common
createIndexNamed: newIndexId then: indexBlock documents: documents
	| createIndexTask index putDocumentsTask |
	createIndexTask := meilisearch createIndex: newIndexId.
	createIndexTask waitEndedForAWhile.
	self assert: createIndexTask isSucceeded.
	index := meilisearch index: newIndexId.
	indexBlock value: index.
	putDocumentsTask := index putDocuments: documents.
	putDocumentsTask waitEndedForAWhile.
	self assert: putDocumentsTask isSucceeded.
	^ index