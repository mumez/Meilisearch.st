tests
testNumberedPagePaginator
	| paginator responses paginator2 responses2 pagedResp |
	self
		createIndexNamed: 'mailisearch-st-test-numbered-page-paginator-1'
		documents: self documentsJson
		do: [ :index |
			paginator := index numberedPagePaginator.
			paginator
				search: 'English';
				hitsPerPage: 5.

			responses := OrderedCollection new.
			[ paginator atEnd ] whileFalse: [ responses add: paginator next ].
			self assert: responses size equals: 6.
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
			paginator2
				search: 'English';
				page: 3;
				hitsPerPage: 6.
			responses2 := OrderedCollection new.
			[ paginator2 atEnd ] whileFalse: [ responses2 add: paginator2 next ].
			self assert: responses2 size equals: 3.
			self assert: (responses2 at: 1) hits size equals: 6.
			self assert: (responses2 at: 1) totalPages equals: 5.
			self assert: (responses2 at: 1) page equals: 3.
			self assert: (responses2 at: 2) hits size equals: 6.
			self assert: (responses2 at: 3) hits size equals: 5.
			self assert: (responses2 at: 3) page equals: 5.

			pagedResp := (paginator2 page: 3) next.
			self
				assertCollection: pagedResp hits
				equals: (responses2 at: 1) hits ]