tests
testHybridSearchVectorizedDocuments
	self
		createIndexNamed: 'mailisearch-st-test-hybrid-search-1'
		then: [ :index |
			index
				setEmbedder: 'mock'
				using: [ :ops | ops userProvided dimensions: 3 ] ]
		documents: self vectorDocumentsJson
		do: [ :index |
			| resp |
			resp := index
				        hybridSearch: 'AAA'
				        vector: #( 1 2 3 )
				        embedder: 'mock'
				        semanticRatio: 1.
			self assert: resp estimatedTotalHits equals: 3.
			self assert: (resp hits first at: 'id') equals: 3.

			resp := index
				        hybridSearch: 'AAA'
				        vector: #( 1 2 3 )
				        embedder: 'mock'
				        semanticRatio: 0.
			self assert: resp estimatedTotalHits equals: 1.
			self assert: (resp hits first at: 'id') equals: 1 ]