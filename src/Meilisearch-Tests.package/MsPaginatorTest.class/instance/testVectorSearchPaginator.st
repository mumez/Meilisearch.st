tests
testVectorSearchPaginator
	| paginator responses paginator2 responses2 |
	self
		createIndexNamed: 'mailisearch-st-test-vector-search-paginator-1'
		then: [ :idx |
			idx
				setEmbedder: 'mock'
				using: [ :ops | ops userProvided dimensions: 3 ] ]
		documents: self vectorDocumentsJson
		do: [ :index |
			paginator := index numberedPagePaginator forVector.
			paginator
				vector: #( 0.2 0.3 0.4 );
				embedder: 'mock';
				hitsPerPage: 6.

			responses := OrderedCollection new.
			[ paginator atEnd ] whileFalse: [ responses add: paginator next ].

			self assert: responses size equals: 4.
			self assert: (responses at: 1) hits size equals: 6.
			self assert: (responses at: 2) hits size equals: 6.
			self assert: (responses at: 3) hits size equals: 6.
			self assert: (responses at: 4) hits size equals: 2.
			self
				assert: ((responses at: 4) hits last at: #title)
				equals: 'Inverse Item'.

			paginator2 := index numberedPagePaginator forVector.
			paginator2
				vector: #( 0 0 0 );
				embedder: 'mock';
				hitsPerPage: 30.
			responses2 := OrderedCollection new.
			[ paginator2 atEnd ] whileFalse: [ responses2 add: paginator2 next ].

			self assert: responses2 size equals: 1.
			self assert: (responses2 at: 1) hits size equals: 20.
			self assert: (responses2 at: 1) hitsPerPage equals: 30.
			self assert: (responses2 at: 1) totalPages equals: 1.
			self assert: (responses2 at: 1) page equals: 1.
			self
				assert: ((responses2 at: 1) hits first at: #title)
				equals: 'First Item'.
			self
				assert: ((responses2 at: 1) hits last at: #title)
				equals: 'Last Item' ]