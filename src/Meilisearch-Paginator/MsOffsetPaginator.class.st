Class {
	#name : 'MsOffsetPaginator',
	#superclass : 'MsPaginator',
	#instVars : [
		'offset',
		'limit'
	],
	#category : 'Meilisearch-Paginator',
	#package : 'Meilisearch-Paginator'
}

{ #category : 'testing' }
MsOffsetPaginator >> atEnd [
	self response ifNil: [ self fire ].
	^ self offset > 0 and: [ self hitsCount = 0 ]
]

{ #category : 'testing' }
MsOffsetPaginator >> atFirst [
	^ self offset = 0
]

{ #category : 'defaults' }
MsOffsetPaginator >> defaultPaginationOptionsBuilder [
	^ [ :opts |
	  opts
		  limit: self limit;
		  offset: self offset ]
]

{ #category : 'accessing' }
MsOffsetPaginator >> limit [

	^ limit ifNil: [ limit := 20 ]
]

{ #category : 'accessing' }
MsOffsetPaginator >> limit: anObject [

	limit := anObject
]

{ #category : 'accessing' }
MsOffsetPaginator >> offset [

	^ offset ifNil: [ offset := 0 ]
]

{ #category : 'accessing' }
MsOffsetPaginator >> offset: anObject [

	offset := anObject
]

{ #category : 'private' }
MsOffsetPaginator >> setOptionsFromResponse: aResponse [
	self offset: aResponse offset.
	self limit: aResponse limit
]

{ #category : 'private' }
MsOffsetPaginator >> setOptionsToNext [
	self offset: self offset + self limit
]

{ #category : 'private' }
MsOffsetPaginator >> setOptionsToPrevious [
	self offset: (self offset - self limit max: 0)
]
