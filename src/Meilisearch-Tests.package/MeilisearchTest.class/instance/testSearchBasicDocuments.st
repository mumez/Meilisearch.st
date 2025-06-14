tests
testSearchBasicDocuments
	self
		createIndexNamed: 'mailisearch-st-test-search-basic'
		documents: self documentsJson
		do: [ :index | | resp |
			resp := index search: 'Healthy'.
			self assert: resp estimatedTotalHits equals: 1.
			self assert: (resp hits first at: 'id') equals: 3.

			resp := index search: 'Future'.
			self assert: resp estimatedTotalHits equals: 2.
			self
				assert: (resp hits collect: [ :each | each at: 'id' ]) sort
				equals: #( 1 2 ).

			resp := index search: 'AI'.
			self assert: resp estimatedTotalHits equals: 3.
			self
				assert: (resp hits collect: [ :each | each at: 'id' ]) sort
				equals: #( 1 2 4 ).

			resp := index search: 'xyzzy'.
			self assert: resp estimatedTotalHits equals: 0 ]