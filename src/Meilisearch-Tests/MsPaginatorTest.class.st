Class {
	#name : 'MsPaginatorTest',
	#superclass : 'MsTestCase',
	#category : 'Meilisearch-Tests',
	#package : 'Meilisearch-Tests'
}

{ #category : 'tests - fixture' }
MsPaginatorTest >> documentsJsonString [
^'[
    {
      "id": 1,
      "title": "Hard Times",
      "language": "English",
      "author": "Charles Dickens",
      "rating": 4.5
    },
    {
      "id": 2,
      "title": "Pride and Prejudice",
      "language": "English",
      "author": "Jane Austen",
      "rating": 4.7
    },
    {
      "id": 3,
      "title": "Moby Dick",
      "language": "English",
      "author": "Herman Melville",
      "rating": 4.8
    },
    {
      "id": 4,
      "title": "The Great Gatsby",
      "language": "English",
      "author": "F. Scott Fitzgerald",
      "rating": 4.8
    },
    {
      "id": 5,
      "title": "War and Peace",
      "language": "Russian",
      "author": "Leo Tolstoy",
      "rating": 4.5
    },
    {
      "id": 6,
      "title": "To Kill a Mockingbird",
      "language": "English",
      "author": "Harper Lee",
      "rating": 4.3
    },
    {
      "id": 7,
      "title": "Alices Adventures in Wonderland",
      "language": "English",
      "author": "Lewis Carroll",
      "rating": 4.3
    },
    {
      "id": 8,
      "title": "Charlottes Web",
      "language": "English",
      "author": "E.B. White",
      "rating": 4.5
    },
    {
      "id": 9,
      "title": "The Hitchhikers Guide to the Galaxy",
      "language": "English",
      "author": "Douglas Adams",
      "rating": 4.3
    },
    {
      "id": 10,
      "title": "Much Ado About Nothing",
      "language": "English",
      "author": "William Shakespeare",
      "rating": 4.3
    },
    {
      "id": 11,
      "title": "Matilda",
      "language": "English",
      "author": "Roald Dahl",
      "rating": 4.4
    },
    {
      "id": 12,
      "title": "1984",
      "language": "English",
      "author": "George Orwell",
      "rating": 4.5
    },
    {
      "id": 13,
      "title": "Animal Farm",
      "language": "English",
      "author": "George Orwell",
      "rating": 4.6
    },
    {
      "id": 14,
      "title": "The Catcher in the Rye",
      "language": "English",
      "author": "J.D. Salinger",
      "rating": 4.4
    },
    {
      "id": 15,
      "title": "Brave New World",
      "language": "English",
      "author": "Aldous Huxley",
      "rating": 4.5
    },
    {
      "id": 16,
      "title": "Fahrenheit 451",
      "language": "English",
      "author": "Ray Bradbury",
      "rating": 4.4
    },
    {
      "id": 17,
      "title": "The Picture of Dorian Gray",
      "language": "English",
      "author": "Oscar Wilde",
      "rating": 4.3
    },
    {
      "id": 18,
      "title": "The Adventures of Huckleberry Finn",
      "language": "English",
      "author": "Mark Twain",
      "rating": 4.5
    },
    {
      "id": 19,
      "title": "Wuthering Heights",
      "language": "English",
      "author": "Emily Bronte",
      "rating": 4.6
    },
    {
      "id": 20,
      "title": "Jane Eyre",
      "language": "English",
      "author": "Charlotte Bronte",
      "rating": 4.7
    },
    {
      "id": 21,
      "title": "The Lord of the Rings",
      "language": "English",
      "author": "J.R.R. Tolkien",
      "rating": 4.8
    },
    {
      "id": 22,
      "title": "The Hobbit",
      "language": "English",
      "author": "J.R.R. Tolkien",
      "rating": 4.7
    },
    {
      "id": 23,
      "title": "The Fellowship of the Ring",
      "language": "English",
      "author": "J.R.R. Tolkien",
      "rating": 4.8
    },
    {
      "id": 24,
      "title": "The Two Towers",
      "language": "English",
      "author": "J.R.R. Tolkien",
      "rating": 4.8
    },
    {
      "id": 25,
      "title": "The Return of the King",
      "language": "English",
      "author": "J.R.R. Tolkien",
      "rating": 4.8
    },
    {
      "id": 26,
      "title": "The Last Portal",
      "language": "English",
      "author": "Sarah Johnson",
      "rating": 4.6
    },
    {
      "id": 27,
      "title": "The History of Middle-earth",
      "language": "English",
      "author": "J.R.R. Tolkien",
      "rating": 4.6
    },
    {
      "id": 28,
      "title": "Whispers of the Ancients",
      "language": "English",
      "author": "Michael Chen",
      "rating": 4.5
    },
    {
      "id": 29,
      "title": "The Lighthouse Keeper",
      "language": "English",
      "author": "Emma Thompson",
      "rating": 4.4
    },
    {
      "id": 30,
      "title": "Echoes of Tomorrow",
      "language": "English",
      "author": "David Martinez",
      "rating": 4.3
    }
  ]'
]

{ #category : 'tests' }
MsPaginatorTest >> testHybridSearchPaginator [
	| paginator responses firstHitsJoined paginator2 responses2 |
	self
		createIndexNamed: 'mailisearch-st-test-hybrid-search-paginator-1'
		then: [ :idx |
			idx
				setEmbedder: 'mock'
				using: [ :ops | ops userProvided dimensions: 3 ] ]
		documents: self vectorDocumentsJson
		do: [ :index |
			paginator := index numberedPagePaginator forHybrid.
			paginator
				query: 'Item';
				vector: #( 0.2 0.3 0.4 );
				embedder: 'mock';
				semanticRatio: 0;
				hitsPerPage: 3.

			responses := OrderedCollection new.
			[ paginator atEnd ] whileFalse: [ responses add: paginator next ].

			self assert: responses size equals: 3.
			self assert: (responses at: 1) hits size equals: 3.
			self assert: (responses at: 1) hitsPerPage equals: 3.
			self assert: (responses at: 1) totalHits equals: 7.
			self assert: (responses at: 1) totalPages equals: 3.
			self assert: (responses at: 1) page equals: 1.
			firstHitsJoined := ' ' join:
				                   ((responses at: 1) hits collect: [ :each |
					                    each at: #title ]).
			self
				assert: firstHitsJoined
				equals: 'Item Item Item Item Item Item Item Item Item'.
			self
				assert: ((responses at: 3) hits last at: #title)
				equals: 'Zero Vector Item'.

			paginator2 := index numberedPagePaginator forVector.
			paginator2
				query: 'Item';
				vector: #( 0 0 0 );
				embedder: 'mock';
				semanticRatio: 1;
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
]

{ #category : 'tests' }
MsPaginatorTest >> testNumberedPagePaginator [
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
]

{ #category : 'tests' }
MsPaginatorTest >> testNumberedPagePaginatorPrevious [
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
]

{ #category : 'tests' }
MsPaginatorTest >> testOffsetPaginator [
	| paginator responses paginator2 responses2 |
	self
		createIndexNamed: 'mailisearch-st-test-offset-paginator-1'
		documents: self documentsJson
		do: [ :index |
			paginator := index offsetPaginator.
			paginator
				search: 'English';
				limit: 5.

			responses := OrderedCollection new.
			[ paginator atEnd ] whileFalse: [ responses add: paginator next ].
			self assert: responses size equals: 7.
			self assert: (responses at: 1) hits size equals: 5.
			self assert: (responses at: 2) hits size equals: 5.
			self assert: (responses at: 3) hits size equals: 5.
			self assert: (responses at: 4) hits size equals: 5.
			self assert: (responses at: 5) hits size equals: 5.
			self assert: (responses at: 6) hits size equals: 4.
			self assert: (responses at: 7) hits size equals: 0.

			paginator2 := index offsetPaginator.
			paginator2
				search: 'English';
				offset: 17;
				limit: 6.
			responses2 := OrderedCollection new.
			[ paginator2 atEnd ] whileFalse: [ responses2 add: paginator2 next ].
			self assert: responses2 size equals: 3.
			self assert: (responses2 at: 1) hits size equals: 6.
			self assert: (responses2 at: 2) hits size equals: 6.
			self assert: (responses2 at: 3) hits size equals: 0 ]
]

{ #category : 'tests' }
MsPaginatorTest >> testOffsetPaginatorPrevious [
	| paginator responses ids |
	self
		createIndexNamed: 'mailisearch-st-test-offset-paginator-2'
		documents: self documentsJson
		do: [ :index |
			paginator := index offsetPaginator.
			paginator
				search: 'English';
				offset: 30;
				limit: 5.

			responses := OrderedCollection new.
			[ paginator atFirst ] whileFalse: [
				responses add: paginator previous ].
			responses add: paginator fire.

			self assert: responses size equals: 7.
			self assert: (responses at: 7) hits size equals: 5.
			ids := (responses at: 7) hits collect: [ :each | each at: #id ].
			self assertCollection: ids equals: #( 1 2 3 4 6 ) ]
]

{ #category : 'tests' }
MsPaginatorTest >> testVectorSearchPaginator [
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
]

{ #category : 'tests - fixture' }
MsPaginatorTest >> vectorDocumentsJsonString [

	^ '[
    {
        "title": "First Item",
        "id": 1,
        "_vectors": {
            "mock": [
                0.2,
                0.3,
                0.4
            ]
        }
    },
    {
        "title": "Zero Vector Item",
        "id": 2,
        "_vectors": {
            "mock": [
                0,
                0,
                0
            ]
        }
    },
    {
        "title": "Item Item",
        "id": 3,
        "_vectors": {
            "mock": [
                -0.81,
                0.8,
                0.61
            ]
        }
    },
    {
        "title": "Item Item Item",
        "id": 4,
        "_vectors": {
            "mock": [
                0.51,
                0.91,
                -0.34
            ]
        }
    },
    {
        "title": "Item Item Item Item",
        "id": 5,
        "_vectors": {
            "mock": [
                -0.97,
                0.92,
                -0.22
            ]
        }
    },
    {
        "title": "EEE",
        "id": 6,
        "_vectors": {
            "mock": [
                0.0,
                0.27,
                -0.88
            ]
        }
    },
    {
        "title": "FFF",
        "id": 7,
        "_vectors": {
            "mock": [
                -0.26,
                0.56,
                0.11
            ]
        }
    },
    {
        "title": "GGG",
        "id": 8,
        "_vectors": {
            "mock": [
                -0.46,
                0.84,
                -0.7
            ]
        }
    },
    {
        "title": "HHH",
        "id": 9,
        "_vectors": {
            "mock": [
                0.96,
                -0.46,
                -0.42
            ]
        }
    },
    {
        "title": "III",
        "id": 10,
        "_vectors": {
            "mock": [
                0.58,
                -0.32,
                -0.18
            ]
        }
    },
    {
        "title": "JJJ",
        "id": 11,
        "_vectors": {
            "mock": [
                0.68,
                -0.19,
                0.72
            ]
        }
    },
    {
        "title": "KKK",
        "id": 12,
        "_vectors": {
            "mock": [
                0.04,
                0.4,
                0.96
            ]
        }
    },
    {
        "title": "LLL",
        "id": 13,
        "_vectors": {
            "mock": [
                -0.06,
                -0.71,
                0.81
            ]
        }
    },
    {
        "title": "MMM",
        "id": 14,
        "_vectors": {
            "mock": [
                0.4,
                0.6,
                0.8
            ]
        }
    },
    {
        "title": "NNN",
        "id": 15,
        "_vectors": {
            "mock": [
                0.17,
                0.37,
                0.08
            ]
        }
    },
    {
        "title": "OOO",
        "id": 16,
        "_vectors": {
            "mock": [
                -0.34,
                -0.67,
                0.89
            ]
        }
    },
    {
        "title": "PPP",
        "id": 17,
        "_vectors": {
            "mock": [
                -0.4,
                -0.35,
                0.1
            ]
        }
    },
    {
        "title": "Inverse Item",
        "id": 18,
        "_vectors": {
            "mock": [
                -0.2,
                -0.3,
                -0.4
            ]
        }
    },
    {
        "title": "RRR",
        "id": 19,
        "_vectors": {
            "mock": [
                0.48,
                0.28,
                0.64
            ]
        }
    },
    {
        "title": "Last Item",
        "id": 20,
        "_vectors": {
            "mock": [
                0.48,
                0.28,
                0.64
            ]
        }
    }
]'
]
