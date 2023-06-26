tests
testTaskEnded
	| originalIndexes newIndexId newIndex createIndexTask deleteIndexTask |
	originalIndexes := meilisearch indexes.
	newIndexId := 'mailisearch-st-test-task-1'.
	createIndexTask := meilisearch createIndex: newIndexId.
	self assert: createIndexTask isEnqueued.
	createIndexTask waitEndedForAWhile.
	self assert: createIndexTask isSucceeded.
	
	newIndex := (meilisearch index: newIndexId) loaded.
	deleteIndexTask := newIndex delete.
	deleteIndexTask waitEndedForAWhile.
	self assert: deleteIndexTask isSucceeded.
	