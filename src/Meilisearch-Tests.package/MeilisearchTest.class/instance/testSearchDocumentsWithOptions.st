tests
testSearchDocumentsWithOptions
	self
		createIndexNamed: 'mailisearch-st-test-search-with-options-1'
		then: [ :index |
			| settingsTask |
			settingsTask := index applySettingsUsing: [ :opts |
				                opts
					                sortableAttributes: #( 'id' 'title' );
					                filterableAttributes: #( 'title' ) ].
			settingsTask waitEndedForAWhile ]
		documents: self documentsJson
		do: [ :index |
			| putDocumentsTask resp |
			putDocumentsTask := index putDocuments: self sortableDocumentsJson.
			putDocumentsTask waitEndedForAWhile.
			self assert: putDocumentsTask isSucceeded.


			resp := index
				        search: 'Smalltalk'
				        optionsUsing: [ :opts | opts sort: #( 'id:desc' ) ].
			self assert: resp estimatedTotalHits equals: 2.
			self
				assert: (resp hits collect: [ :each | each at: 'id' ])
				equals: #( 100 10 ).

			resp := index
				        search: 'AI'
				        optionsUsing: [ :opts |
				        opts filter: 'title = "The Internet and AI"' ].
			self assert: resp estimatedTotalHits equals: 1.
			self
				assert: (resp hits collect: [ :each | each at: 'id' ])
				equals: #( 4 ) ]