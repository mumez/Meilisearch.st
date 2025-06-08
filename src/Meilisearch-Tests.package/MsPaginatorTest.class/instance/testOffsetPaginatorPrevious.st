tests
testOffsetPaginatorPrevious
	| newIndexId index documents paginator responses ids |
	newIndexId := 'mailisearch-st-test-offset-paginator-2'.
	documents := self documentsJson.
	index := self createIndexNamed: newIndexId documents: documents.
	
	paginator := index offsetPaginator.
	paginator search: 'English'; offset: 30; limit: 5.
	
	responses := OrderedCollection new.
	[ paginator atFirst ] whileFalse: [ 
		responses add: paginator previous.
	].
	responses add: paginator fire.
	self assert: responses size equals: 7.
	self assert: (responses at: 7) hits size equals: 5.
	ids := ((responses at: 7) hits  collect: [:each | each at: #id]).
	self assertCollection: ids equals: #(1 2 3 4 6). 
	
	self deleteAllDocumentsIn: index