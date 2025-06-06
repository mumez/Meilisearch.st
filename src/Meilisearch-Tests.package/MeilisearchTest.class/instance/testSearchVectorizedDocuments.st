tests
testSearchVectorizedDocuments
	| originalIndexes newIndexId index createIndexTask documents putDocumentsTask resp deleteDocumentsTask deleteIndexTask |
	originalIndexes := meilisearch indexes.
	newIndexId := 'mailisearch-st-test-vector-search-1'.
	createIndexTask := meilisearch createIndex: newIndexId.
	createIndexTask waitEndedForAWhile.
	self assert: createIndexTask isSucceeded.
	index := (meilisearch index: newIndexId).
	index setEmbedder: 'mock' using: [:ops | ops userProvided dimensions: 3].
	documents := self vectorDocumentsJson.
		
	putDocumentsTask := index putDocuments: documents.
	putDocumentsTask waitEndedForAWhile.
	self assert: putDocumentsTask isSucceeded.
	
	resp := index vectorSearch: #(1 2 3) embedder: 'mock'.
	self assert: resp estimatedTotalHits equals: 3.
	self assert: (resp hits first at: 'id') equals: 3.
	
	resp := index vectorSearch: #(0 0 0) embedder: 'mock'.
	self assert: resp estimatedTotalHits equals: 3.
	
	resp := index vectorSearch: #(0 0.8 0.2) embedder: 'mock'.
	self assert: resp estimatedTotalHits equals: 3.
	self assert: (resp hits first at: 'id') equals: 1.
	
	deleteDocumentsTask := index deleteAllDocuments.
	deleteDocumentsTask waitEndedForAWhile.
	
	resp := index getAllDocuments.
	self assert: resp total equals: 0.
	
	deleteIndexTask := index delete.
	deleteIndexTask waitEndedForAWhile.
	self assert: deleteIndexTask isSucceeded.
	