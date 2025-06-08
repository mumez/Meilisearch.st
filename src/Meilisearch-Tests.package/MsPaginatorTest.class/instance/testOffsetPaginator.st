tests
testOffsetPaginator
	| newIndexId index documents paginator responses paginator2 responses2 |
	newIndexId := 'mailisearch-st-test-offset-paginator-1'.
	documents := self documentsJson.
	index := self createIndexNamed: newIndexId documents: documents.
	
	paginator := index offsetPaginator.
	paginator search: 'English'; limit: 5.
	
	responses := OrderedCollection new.
	[ paginator atEnd ] whileFalse: [ 
		responses add: paginator next.
	].
	self assert: responses size equals: 7.
	self assert: (responses at: 1) hits size equals: 5.
	self assert: (responses at: 2) hits size equals: 5.
	self assert: (responses at: 3) hits size equals: 5.
	self assert: (responses at: 4) hits size equals: 5.
	self assert: (responses at: 5) hits size equals: 5.
	self assert: (responses at: 6) hits size equals: 4.
	self assert: (responses at: 7) hits size equals: 0.
	
	paginator2 := index offsetPaginator.
	paginator2 search: 'English'; offset: 17; limit: 6.
	responses2 := OrderedCollection new.
	[ paginator2 atEnd ] whileFalse: [ 
		responses2 add: paginator2 next.
	].
	self assert: responses2 size equals: 3.
	self assert: (responses2 at: 1) hits size equals: 6.
	self assert: (responses2 at: 2) hits size equals: 6.
	self assert: (responses2 at: 3) hits size equals: 0.
	
	self deleteAllDocumentsIn: index