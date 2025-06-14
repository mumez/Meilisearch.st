tests
testNumberedPagePaginatorPrevious
	| paginator responses ids |
	self
		createIndexNamed: 'mailisearch-st-test-numbered-page-paginator-2'
		documents: self documentsJson
		do: [ :index |
			paginator := index numberedPagePaginator.
			paginator
				search: 'English';
				page: 6;
				hitsPerPage: 5.

			responses := OrderedCollection new.
			[ paginator atFirst ] whileFalse: [
				responses add: paginator previous ].
			responses add: paginator fire.
			self assert: responses size equals: 6.
			self assert: (responses at: 6) hits size equals: 5.
			ids := (responses at: 6) hits collect: [ :each | each at: #id ].
			self assertCollection: ids equals: #( 1 2 3 4 6 ) ]