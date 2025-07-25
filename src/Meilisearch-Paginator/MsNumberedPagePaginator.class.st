Class {
	#name : 'MsNumberedPagePaginator',
	#superclass : 'MsPaginator',
	#instVars : [
		'page',
		'hitsPerPage'
	],
	#category : 'Meilisearch-Paginator',
	#package : 'Meilisearch-Paginator'
}

{ #category : 'testing' }
MsNumberedPagePaginator >> atEnd [
	self response ifNil: [ ^ false ].
	^ self page > self totalPages
]

{ #category : 'testing' }
MsNumberedPagePaginator >> atFirst [
	^ self page = 1
]

{ #category : 'defaults' }
MsNumberedPagePaginator >> defaultPaginationOptionsBuilder [
	^ [ :opts |
	  opts
		  hitsPerPage: self hitsPerPage;
		  page: self page ]
]

{ #category : 'accessing' }
MsNumberedPagePaginator >> hitsPerPage [

	^ hitsPerPage ifNil: [ hitsPerPage := 20 ]
]

{ #category : 'accessing' }
MsNumberedPagePaginator >> hitsPerPage: anObject [

	hitsPerPage := anObject
]

{ #category : 'accessing' }
MsNumberedPagePaginator >> page [

	^ page ifNil: [ page := 1 ]
]

{ #category : 'accessing' }
MsNumberedPagePaginator >> page: anObject [

	page := anObject
]

{ #category : 'private' }
MsNumberedPagePaginator >> setOptionsFromResponse: aResponse [
	self page: aResponse page.
	self hitsPerPage: aResponse hitsPerPage
]

{ #category : 'private' }
MsNumberedPagePaginator >> setOptionsToNext [
	self page: self page + 1
]

{ #category : 'private' }
MsNumberedPagePaginator >> setOptionsToPrevious [
	self page: self page - 1
]

{ #category : 'accessing' }
MsNumberedPagePaginator >> totalHits [
	^ self response ifNil: [ 0 ] ifNotNil: [ :resp | resp totalHits ]
]

{ #category : 'accessing' }
MsNumberedPagePaginator >> totalPages [
	^ self response ifNil: [ 0 ] ifNotNil: [ :resp | resp totalPages ]
]
