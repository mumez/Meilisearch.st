tests
testCreateDeleteIndex
	| originalIndexes newIndexId newIndex newlIndexes createIndexTask deleteIndexTask |
	originalIndexes := meilisearch indexes.
	newIndexId := 'mailisearch-st-test-index-1'.
	createIndexTask := meilisearch createIndex: newIndexId.
	self assert: createIndexTask isEnqueued.
	createIndexTask waitEndedForAWhile.
	self assert: createIndexTask isSucceeded.
	newlIndexes := meilisearch indexes.
	self assert: newlIndexes total - originalIndexes total equals: 1.
	
	newIndex := (meilisearch index: newIndexId) loaded.
	self assert: newIndex uid equals: newIndexId.
	
	deleteIndexTask := newIndex delete.
	deleteIndexTask waitEndedForAWhile.
	self assert: deleteIndexTask isSucceeded.
	newlIndexes := meilisearch indexes.
	self assert: newlIndexes total - originalIndexes total equals: 0.
	