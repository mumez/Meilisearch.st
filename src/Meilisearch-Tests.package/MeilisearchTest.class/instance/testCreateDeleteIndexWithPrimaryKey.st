tests
testCreateDeleteIndexWithPrimaryKey
	| originalIndexes newIndexId newIndex newlIndexes createIndexTask deleteIndexTask |
	originalIndexes := meilisearch indexes.
	newIndexId := 'mailisearch-st-test-index-2'.
	createIndexTask := meilisearch createIndex: newIndexId primaryKey: 'primKey'.
	self assert: createIndexTask isEnqueued.
	self waitABit.
	self assert: createIndexTask checkStatus isSucceeded.
	newlIndexes := meilisearch indexes.
	self assert: newlIndexes total - originalIndexes total equals: 1.
	
	newIndex := (meilisearch index: newIndexId) loaded.
	self assert: newIndex uid equals: newIndexId.
	self assert: newIndex primaryKey equals: 'primKey'.
	
	deleteIndexTask := newIndex delete.
	self waitABit.
	self assert: deleteIndexTask checkStatus isSucceeded.
	newlIndexes := meilisearch indexes.
	self assert: newlIndexes total - originalIndexes total equals: 0.
	