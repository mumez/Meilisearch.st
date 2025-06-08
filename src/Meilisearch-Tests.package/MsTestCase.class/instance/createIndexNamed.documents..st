tests - common
createIndexNamed: newIndexId documents: documents
	| createIndexTask index putDocumentsTask |
	createIndexTask := meilisearch createIndex: newIndexId.
	createIndexTask waitEndedForAWhile.
	self assert: createIndexTask isSucceeded.
	index := (meilisearch index: newIndexId).		
	putDocumentsTask := index putDocuments: documents.
	putDocumentsTask waitEndedForAWhile.
	self assert: putDocumentsTask isSucceeded.
	^ index