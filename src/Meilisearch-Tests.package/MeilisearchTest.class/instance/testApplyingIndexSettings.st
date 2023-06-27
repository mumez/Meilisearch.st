tests
testApplyingIndexSettings
	| originalIndexes newIndexId createIndexTask index origSettings settings deleteIndexTask |
	originalIndexes := meilisearch indexes.
	newIndexId := 'mailisearch-st-test-settings-1'.
	createIndexTask := meilisearch createIndex: newIndexId.
	createIndexTask waitEndedForAWhile.
	self assert: createIndexTask isSucceeded.
	index := meilisearch index: newIndexId.
	origSettings := index getAllSettings.
	self assert: origSettings displayedAttributes equals: #('*').
	self assert: origSettings filterableAttributes equals: #().
	self assert: origSettings searchableAttributes equals: #('*').
	self assert: origSettings sortableAttributes equals: #().
	
	{
	index setDisplayedAttributes: #('id').
	index setFilterableAttributes: #('id').
	index setSearchableAttributes: #('id').
	index setSortableAttributes: #('id')
	} do: [ :each | each waitEndedForAWhile ].
	
	settings := index getAllSettings.
	self assert: settings displayedAttributes equals: #('id').
	self assert: settings filterableAttributes equals: #('id').
	self assert: settings searchableAttributes equals: #('id').
	self assert: settings sortableAttributes equals: #('id').
	
	index resetSettings waitEndedForAWhile.
	settings := index getAllSettings.
	self assert: settings displayedAttributes equals: #('*').
	self assert: settings filterableAttributes equals: #().
	self assert: settings searchableAttributes equals: #('*').
	self assert: settings sortableAttributes equals: #().
	
	deleteIndexTask := index delete.
	deleteIndexTask waitEndedForAWhile.
	self assert: deleteIndexTask isSucceeded.