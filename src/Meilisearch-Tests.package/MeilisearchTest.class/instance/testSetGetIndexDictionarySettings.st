tests
testSetGetIndexDictionarySettings
	| originalIndexes newIndexId index settingsTask createIndexTask appliedSettings deleteIndexTask |
	originalIndexes := meilisearch indexes.
	newIndexId := 'mailisearch-st-test-index-dictionary-settings'.
	createIndexTask := meilisearch createIndex: newIndexId.
	createIndexTask waitEndedForAWhile.
	self assert: createIndexTask isSucceeded.
	
	index := (meilisearch index: newIndexId).
	settingsTask := index applySettingsUsing: [ :opts | 
		opts dictionary: #('J. R. R.' 'J.R.R.').
	].
	settingsTask waitEndedForAWhile.
	
	appliedSettings := index getAllSettings.
	
	self assert: appliedSettings dictionary asSortedCollection equals: #('J. R. R.' 'J.R.R.') asSortedCollection.
	
	(index setDictionary: #('1')) waitEndedForAWhile.
	
	appliedSettings := index getAllSettings.
	
	self assert: appliedSettings dictionary asSortedCollection equals: #('1') asSortedCollection.
	
	deleteIndexTask := index delete.
	deleteIndexTask waitEndedForAWhile.
	self assert: deleteIndexTask isSucceeded.