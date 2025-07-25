Class {
	#name : 'MsPaginator',
	#superclass : 'Object',
	#instVars : [
		'searcher',
		'query',
		'vector',
		'semanticRatio',
		'response',
		'searchBlock',
		'paginationOptionsBuilder',
		'embedder'
	],
	#category : 'Meilisearch-Paginator',
	#package : 'Meilisearch-Paginator'
}

{ #category : 'instance creation' }
MsPaginator class >> on: searcher [
	^ self new searcher: searcher; yourself 
]

{ #category : 'instance creation' }
MsPaginator class >> response: response [
	"for starting from an existing response"
	^ self new 
		response: response;
		setOptionsFromResponse: response; 
		yourself 
]

{ #category : 'testing' }
MsPaginator >> atEnd [
]

{ #category : 'testing' }
MsPaginator >> atFirst [
]

{ #category : 'defaults' }
MsPaginator >> defaultHybridSearchBlock [
	^ [
	  self searcher
		  hybridSearch: self query
		  vector: self vector
		  embedder: self embedder
		  semanticRatio: self semanticRatio
		  optionsUsing: self paginationOptionsBuilder ]
]

{ #category : 'defaults' }
MsPaginator >> defaultPaginationOptionsBuilder [
	^ [ :opts | opts ]
]

{ #category : 'defaults' }
MsPaginator >> defaultSearchBlock [
	^ [ self searcher search: self query optionsUsing: self paginationOptionsBuilder ]
]

{ #category : 'defaults' }
MsPaginator >> defaultVectorSearchBlock [
	^ [
	  self searcher
		  vectorSearch: self vector
		  embedder: self embedder
		  optionsUsing: self paginationOptionsBuilder ]
]

{ #category : 'accessing' }
MsPaginator >> embedder [

	^ embedder
]

{ #category : 'accessing' }
MsPaginator >> embedder: anObject [

	embedder := anObject
]

{ #category : 'actions' }
MsPaginator >> fire [
	self response: self searchBlock value.
	self setOptionsFromResponse: self response.
	^ self response
]

{ #category : 'changing search' }
MsPaginator >> forHybrid [
	self searchBlock: self defaultHybridSearchBlock 
]

{ #category : 'changing search' }
MsPaginator >> forVector [
	self searchBlock: self defaultVectorSearchBlock 
]

{ #category : 'accessing' }
MsPaginator >> hitsCount [
	^ self response ifNil: [ 0 ] ifNotNil: [ :resp | resp hits size ]
]

{ #category : 'actions' }
MsPaginator >> next [
	self fire.
	self setOptionsToNext.
	^ self response
]

{ #category : 'accessing' }
MsPaginator >> paginationOptionsBuilder [

	^ paginationOptionsBuilder ifNil: [ paginationOptionsBuilder := self defaultPaginationOptionsBuilder ]
]

{ #category : 'accessing' }
MsPaginator >> paginationOptionsBuilder: anObject [

	paginationOptionsBuilder := anObject
]

{ #category : 'actions' }
MsPaginator >> previous [
	self fire.
	self setOptionsToPrevious.
	^ self response
]

{ #category : 'accessing' }
MsPaginator >> query [

	^ query
]

{ #category : 'accessing' }
MsPaginator >> query: anObject [

	query := anObject
]

{ #category : 'accessing' }
MsPaginator >> response [

	^ response
]

{ #category : 'accessing' }
MsPaginator >> response: anObject [

	response := anObject
]

{ #category : 'accessing' }
MsPaginator >> search: queryString [
	"Alias of query:"
	self query: queryString
]

{ #category : 'accessing' }
MsPaginator >> searchBlock [

	^ searchBlock ifNil: [ searchBlock := self defaultSearchBlock ]
]

{ #category : 'accessing' }
MsPaginator >> searchBlock: anObject [

	searchBlock := anObject
]

{ #category : 'accessing' }
MsPaginator >> searcher [

	^ searcher
]

{ #category : 'accessing' }
MsPaginator >> searcher: anObject [

	searcher := anObject
]

{ #category : 'accessing' }
MsPaginator >> semanticRatio [

	^ semanticRatio
]

{ #category : 'accessing' }
MsPaginator >> semanticRatio: anObject [

	semanticRatio := anObject
]

{ #category : 'private' }
MsPaginator >> setOptionsFromResponse: aResponse [
]

{ #category : 'private' }
MsPaginator >> setOptionsToNext [
]

{ #category : 'private' }
MsPaginator >> setOptionsToPrevious [
]

{ #category : 'accessing' }
MsPaginator >> vector [

	^ vector
]

{ #category : 'accessing' }
MsPaginator >> vector: anObject [

	vector := anObject
]
