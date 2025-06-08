tests
testNumberedPagePaginatorPrevious
	| originalIndexes newIndexId index documents paginator responses ids |
	originalIndexes := meilisearch indexes.
	newIndexId := 'mailisearch-st-test-numbered-page-paginator-2'.
	documents := self documentsJson.
	index := self createIndexNamed: newIndexId documents: documents.
	
	paginator := index numberedPagePaginator.
	paginator search: 'English'; page: 6; hitsPerPage: 5.
	
	responses := OrderedCollection new.
	[ paginator atFirst ] whileFalse: [ 
		responses add: paginator previous.
	].
	responses add: paginator fire.
	self assert: responses size equals: 6.
	self assert: (responses at: 6) hits size equals: 5.
	ids := ((responses at: 6) hits  collect: [:each | each at: #id]).
	self assertCollection: ids equals: #(1 2 3 4 6). 
	
	self deleteAllDocumentsIn: index.