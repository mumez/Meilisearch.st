tests
testSetGetIndexSeparatorTokensSettings
	| originalIndexes newIndexId index settingsTask createIndexTask appliedSettings deleteIndexTask |
	originalIndexes := meilisearch indexes.
	newIndexId := 'mailisearch-st-test-index-separator-tokens-settings'.
	createIndexTask := meilisearch createIndex: newIndexId.
	createIndexTask waitEndedForAWhile.
	self assert: createIndexTask isSucceeded.
	
	index := (meilisearch index: newIndexId).
	settingsTask := index applySettingsUsing: [ :opts | 
		opts separatorTokens: #('|' '&hellip;'); nonSeparatorTokens: #('@' '#' '&').
	].
	settingsTask waitEndedForAWhile.
	
	appliedSettings := index getAllSettings.
	
	self assert: appliedSettings separatorTokens asSortedCollection equals: #('|' '&hellip;') asSortedCollection.
	self assert: appliedSettings nonSeparatorTokens asSortedCollection equals: #('@' '#' '&') asSortedCollection.
	
	(index setSeparatorTokens: #('1')) waitEndedForAWhile.
	(index setNonSeparatorTokens: #('2')) waitEndedForAWhile.
	
	appliedSettings := index getAllSettings.
	
	self assert: appliedSettings separatorTokens asSortedCollection equals: #('1') asSortedCollection.
	self assert: appliedSettings nonSeparatorTokens asSortedCollection equals: #('2') asSortedCollection.
	
	deleteIndexTask := index delete.
	deleteIndexTask waitEndedForAWhile.
	self assert: deleteIndexTask isSucceeded.