tests
testVectorSearchPaginator
	| originalIndexes newIndexId index documents paginator responses paginator2 responses2 pagedResp |
	originalIndexes := meilisearch indexes.
	newIndexId := 'mailisearch-st-test-vector-search-paginator-1'.
	documents := self vectorDocumentsJson.
	index := self createIndexNamed: newIndexId then: [:idx | idx setEmbedder: 'mock' using: [:ops | ops userProvided dimensions: 3]] documents: documents.
	
	
	paginator := index numberedPagePaginator forVector.
	paginator vector: #(0.2 0.3 0.4); embedder: 'mock'; hitsPerPage: 5.
	
	responses := OrderedCollection new.
	[ paginator atEnd ] whileFalse: [ 
		responses add: paginator next.
	].
	responses inspect.
	
	"self assert: responses size equals: 6.
	self assert: (responses at: 1) hits size equals: 5.
	self assert: (responses at: 1) totalPages equals: 6.
	self assert: (responses at: 1) page equals: 1.
	self assert: (responses at: 2) hits size equals: 5.
	self assert: (responses at: 3) hits size equals: 5.
	self assert: (responses at: 4) hits size equals: 5.
	self assert: (responses at: 5) hits size equals: 5.
	self assert: (responses at: 6) hits size equals: 4.
	self assert: (responses at: 6) page equals: 6.
	
	paginator2 := index numberedPagePaginator.
	paginator2 search: 'English'; page: 3; hitsPerPage: 6.
	responses2 := OrderedCollection new.
	[ paginator2 atEnd ] whileFalse: [ 
		responses2 add: paginator2 next.
	].
	self assert: responses2 size equals: 3.
	self assert: (responses2 at: 1) hits size equals: 6.
	self assert: (responses2 at: 1) totalPages equals: 5.
	self assert: (responses2 at: 1) page equals: 3.
	self assert: (responses2 at: 2) hits size equals: 6.
	self assert: (responses2 at: 3) hits size equals: 5.
	self assert: (responses2 at: 3) page equals: 5.
	
	pagedResp := (paginator2 page: 3) next.
	self assertCollection: pagedResp hits equals: (responses2 at: 1) hits."
	
	self deleteAllDocumentsIn: index