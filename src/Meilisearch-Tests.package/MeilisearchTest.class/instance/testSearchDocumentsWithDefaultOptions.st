tests
testSearchDocumentsWithDefaultOptions
	self
		createIndexNamed: 'mailisearch-st-test-search-default-options-1'
		then: [ :index |
			index defaultSearchOptionsUsing: [ :opts |
				opts
					showRankingScore: true;
					limit: 2 ] ]
		documents: self documentsJson
		do: [ :index | | resp |
			resp := index search: 'Healthy'.
			self assert: resp estimatedTotalHits equals: 1.
			self assert: (resp hits first at: 'id') equals: 3.
			self assert: (resp hits first includesKey: '_rankingScore').
			self
				assert: (resp hits first at: '_rankingScore') > 0.8
				equals: true.

			resp := index search: 'Future'.
			self assert: resp estimatedTotalHits equals: 2.
			self
				assert: (resp hits collect: [ :each | each at: 'id' ]) sort
				equals: #( 1 2 ).

			resp := index search: 'AI'.
			self assert: resp estimatedTotalHits equals: 3.
			self assert: resp hits size equals: 2.
			self
				assert: (resp hits collect: [ :each | each at: 'id' ]) sort
				equals: #( 1 2 ).

			resp := index search: 'xyzzy'.
			self assert: resp estimatedTotalHits equals: 0 ]