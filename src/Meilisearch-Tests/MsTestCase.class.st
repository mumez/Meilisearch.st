Class {
	#name : 'MsTestCase',
	#superclass : 'TestCase',
	#instVars : [
		'meilisearch'
	],
	#classVars : [
		'Settings'
	],
	#category : 'Meilisearch-Tests',
	#package : 'Meilisearch-Tests'
}

{ #category : 'class initialization' }
MsTestCase class >> initialize [
	Settings := MsSettings fromDefault.
	
	"Please edit for your environment"
	Settings targetUrl: 'http://127.0.0.1:7700'.
	"Settings apiKey: 'your-api-key'"
	Settings apiKey: 'meili-master-key-for-test'.
]

{ #category : 'accessing' }
MsTestCase class >> settings [
	^Settings 
]

{ #category : 'tests - common' }
MsTestCase >> createIndexNamed: newIndexId documents: documents [
	^ self createIndexNamed: newIndexId then: [:idx | ] documents: documents
]

{ #category : 'tests - common' }
MsTestCase >> createIndexNamed: newIndexId documents: documents do: testingBlock [
	self createIndexNamed: newIndexId then: [:idx| ] documents: documents do: testingBlock
]

{ #category : 'tests - common' }
MsTestCase >> createIndexNamed: newIndexId then: indexBlock documents: documents [
	| createIndexTask index putDocumentsTask |
	createIndexTask := meilisearch createIndex: newIndexId.
	createIndexTask waitEndedForAWhile.
	self assert: createIndexTask isSucceeded.
	index := meilisearch index: newIndexId.
	indexBlock value: index.
	putDocumentsTask := index putDocuments: documents.
	putDocumentsTask waitEndedForAWhile.
	self assert: putDocumentsTask isSucceeded.
	^ index
]

{ #category : 'tests - common' }
MsTestCase >> createIndexNamed: newIndexId then: indexBlock documents: documents do: testingBlock [
	| index |
	[
	index := self createIndexNamed: newIndexId then: indexBlock documents: documents.
	testingBlock value: index ] ensure: [
		index ifNotNil: [ self deleteAllDocumentsIn: index ] ]
]

{ #category : 'tests - common' }
MsTestCase >> deleteAllDocumentsIn: index [
	| deleteDocumentsTask resp deleteIndexTask |
	deleteDocumentsTask := index deleteAllDocuments.
	deleteDocumentsTask waitEndedForAWhile.
	
	resp := index getAllDocuments.
	self assert: resp total equals: 0.
	
	deleteIndexTask := index delete.
	deleteIndexTask waitEndedForAWhile.
	self assert: deleteIndexTask isSucceeded.
]

{ #category : 'tests - fixture' }
MsTestCase >> documentsJson [
	^ meilisearch portableUtil readJsonFrom: self documentsJsonString readStream
]

{ #category : 'tests - fixture' }
MsTestCase >> documentsJsonString [

	^ '[
    {
        "id": 1,
        "title": "Exploring AI: The Future of Technology",
        "contents": "Artificial Intelligence (AI) is transforming the digital landscape. From autonomous driving to automated customer service, AI technology is everywhere and it is the future of technology."
    },
    {
        "id": 2,
        "title": "AI and Space: The Future is Here",
        "contents": "The fusion of AI and space exploration has taken significant leaps in recent years. The discovery of water on Mars and the ambition of landing humans on Mars, all with the help of AI, has piqued interest."
    },
    {
        "id": 3,
        "title": "A Guide to Healthy Eating",
        "contents": "Eating a balanced diet is vital for health and wellbeing. Food provides our bodies with the energy, protein, essential fats, vitamins and minerals to live, grow and function properly."
    },
    {
        "id": 4,
        "title": "The Internet and AI",
        "contents": "The internet has revolutionized the computer and communications world like nothing before. The invention of the telegraph, telephone, radio, and computer set the stage for this unprecedented integration of capabilities. Now, with the advancement of AI, we can expect even more changes."
    },
    {
        "id": 5,
        "title": "The Art of Photography",
        "contents": "Photography is the science, art, application and practice of creating durable images by recording light or other electromagnetic radiation, either electronically by means of an image sensor, or chemically by means of a light-sensitive material such as photographic film."
    }
]
'
]

{ #category : 'tests - fixture' }
MsTestCase >> extraDocumentJson [
	^ meilisearch portableUtil readJsonFrom: self extraDocumentJsonString readStream
]

{ #category : 'tests - fixture' }
MsTestCase >> extraDocumentJsonString [

	^ '{
    "id": 6,
    "title": "Healthy Lifestyle: Exercise and Diet",
    "contents": "Maintaining a healthy lifestyle involves regular exercise and a balanced diet. Not only does it improve physical health, but it also has significant benefits for mental wellbeing."
}'
]

{ #category : 'tests - fixture' }
MsTestCase >> facetsDocumentsJson [
	^ meilisearch portableUtil readJsonFrom: self facetsDocumentsJsonString readStream
]

{ #category : 'tests - fixture' }
MsTestCase >> facetsDocumentsJsonString [

	^ '[
  {
    "id": 5,
    "title": "Hard Times",
    "genres": [
      "Classics",
      "Fiction",
      "Victorian",
      "Literature"
    ],
    "language": "English",
    "author": "Charles Dickens",
    "rating": 4.5
  },
  {
    "id": 6,
    "title": "Pride and Prejudice",
    "genres": [
      "Classics",
      "Romance",
      "Literature"
    ],
    "language": "English",
    "author": "Jane Austen",
    "rating": 4.7
  },
  {
    "id": 7,
    "title": "Moby Dick",
    "genres": [
      "Classics",
      "Adventure",
      "Literature"
    ],
    "language": "English",
    "author": "Herman Melville",
    "rating": 4.8
  },
  {
    "id": 8,
    "title": "The Great Gatsby",
    "genres": [
      "Classics",
      "Fiction",
      "Literature",
      "American"
    ],
    "language": "English",
    "author": "F. Scott Fitzgerald",
    "rating": 4.8
  },
  {
    "id": 9,
    "title": "War and Peace",
    "genres": [
      "Classics",
      "Historical",
      "Literature",
      "Russian"
    ],
    "language": "Russian",
    "author": "Leo Tolstoy",
    "rating": 4.5
  },
  {
    "id": 10,
    "title": "To Kill a Mockingbird",
    "genres": [
      "Classics",
      "Historical",
      "Literature",
      "American"
    ],
    "language": "English",
    "author": "Harper Lee",
    "rating": 4.3
  },
  {
    "id": 11,
    "title": "Alices Adventures in Wonderland",
    "genres": [
      "Childrens Literature",
      "Classics",
      "Fantasy"
    ],
    "language": "English",
    "author": "Lewis Carroll",
    "rating": 4.3
  },
  {
    "id": 12,
    "title": "Charlottes Web",
    "genres": [
      "Childrens Literature",
      "Classics"
    ],
    "language": "English",
    "author": "E.B. White",
    "rating": 4.5
  },
  {
    "id": 13,
    "title": "The Hitchhikers Guide to the Galaxy",
    "genres": [
      "Comedy",
      "Science Fiction",
      "Adventure"
    ],
    "language": "English",
    "author": "Douglas Adams",
    "rating": 4.3
  },
  {
    "id": 14,
    "title": "Much Ado About Nothing",
    "genres": [
      "Comedy",
      "Classics",
      "Drama"
    ],
    "language": "English",
    "author": "William Shakespeare",
    "rating": 4.3
  },
  {
    "id": 15,
    "title": "Matilda",
    "genres": [
      "Childrens Literature",
      "Comedy",
      "Classics"
    ],
    "language": "English",
    "author": "Roald Dahl",
    "rating": 4.4
  }
]'
]

{ #category : 'running' }
MsTestCase >> setUp [
	super setUp.
	meilisearch := MeiliSearch settings: self class settings
]

{ #category : 'tests - fixture' }
MsTestCase >> sortableDocumentsJson [
	^ meilisearch portableUtil readJsonFrom: self sortableDocumentsJsonString readStream
]

{ #category : 'tests - fixture' }
MsTestCase >> sortableDocumentsJsonString [

	^ '[
    {
        "id": 10,
        "title": "Smalltalk",
        "contents": "The Smalltalk system"
    },
    {
        "id": 100,
        "title": "Smalltalk",
        "contents": "The Smalltalk system"
    }
]
'
]

{ #category : 'tests - fixture' }
MsTestCase >> vectorDocumentsJson [
	^ meilisearch portableUtil readJsonFrom: self vectorDocumentsJsonString readStream
]

{ #category : 'tests - fixture' }
MsTestCase >> vectorDocumentsJsonString [

	^ '[
    {
        "title": "AAA",
        "id": 1,
        "_vectors": {
            "mock": [
                0,
                0.8,
                -0.2
            ]
        }
    },
    {
        "title": "BBB",
        "id": 2,
        "_vectors": {
            "mock": [
                1,
                -0.2,
                0
            ]
        }
    },
    {
        "title": "CCC",
        "id": 3,
        "_vectors": {
            "mock": [
                1,
                2,
                3
            ]
        }
    }
]'
]
