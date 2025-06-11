tests
testHybridSearchPaginator
	| newIndexId index documents paginator responses firstHitsJoined paginator2 responses2 |
	newIndexId := 'mailisearch-st-test-hybrid-search-paginator-1'.
	documents := self vectorDocumentsJson.
	index := self createIndexNamed: newIndexId then: [:idx | idx setEmbedder: 'mock' using: [:ops | ops userProvided dimensions: 3]] documents: documents.
	
	paginator := index numberedPagePaginator forHybrid.
	paginator query: 'Item'; vector: #(0.2 0.3 0.4); embedder: 'mock'; semanticRatio: 0; hitsPerPage: 3.
	
	responses := OrderedCollection new.
	[ paginator atEnd ] whileFalse: [ 
		responses add: paginator next.
	].

	self assert: responses size equals: 3.
	self assert: (responses at: 1) hits size equals: 3.
	self assert: (responses at: 1) hitsPerPage equals: 3.
	self assert: (responses at: 1) totalHits equals: 7.
	self assert: (responses at: 1) totalPages equals: 3.
	self assert: (responses at: 1) page equals: 1.
	firstHitsJoined := (' ' join: ((responses at: 1) hits collect: [ :each | each at: #title ])). 
	self assert: firstHitsJoined equals: 'Item Item Item Item Item Item Item Item Item'.
	self assert: ((responses at: 3) hits last at: #title) equals: 'Zero Vector Item'.
	
	paginator2 := index numberedPagePaginator forVector.
	paginator2 query: 'Item'; vector: #(0 0 0); embedder: 'mock'; semanticRatio: 1; hitsPerPage: 30.
	responses2 := OrderedCollection new.
	[ paginator2 atEnd ] whileFalse: [ 
		responses2 add: paginator2 next.
	].

	self assert: responses2 size equals: 1.
	self assert: (responses2 at: 1) hits size equals: 20.
	self assert: (responses2 at: 1) hitsPerPage equals: 30.
	self assert: (responses2 at: 1) totalPages equals: 1.
	self assert: (responses2 at: 1) page equals: 1.
	self assert: ((responses2 at: 1) hits first at: #title) equals: 'First Item'.
	self assert: ((responses2 at: 1) hits last at: #title) equals: 'Last Item'.
	
	self deleteAllDocumentsIn: index