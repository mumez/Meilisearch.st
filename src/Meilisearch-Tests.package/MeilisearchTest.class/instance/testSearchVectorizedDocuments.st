tests
testSearchVectorizedDocuments
	self
		createIndexNamed: 'mailisearch-st-test-vector-search-1'
		then: [ :index |
			index
				setEmbedder: 'mock'
				using: [ :ops | ops userProvided dimensions: 3 ] ]
		documents: self vectorDocumentsJson
		do: [ :index |
			| resp |
			resp := index vectorSearch: #( 1 2 3 ) embedder: 'mock'.
			self assert: resp estimatedTotalHits equals: 3.
			self assert: (resp hits first at: 'id') equals: 3.

			resp := index vectorSearch: #( 0 0 0 ) embedder: 'mock'.
			self assert: resp estimatedTotalHits equals: 3.

			resp := index vectorSearch: #( 0 0.8 0.2 ) embedder: 'mock'.
			self assert: resp estimatedTotalHits equals: 3.
			self assert: (resp hits first at: 'id') equals: 1 ]