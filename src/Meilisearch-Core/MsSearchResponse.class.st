Class {
	#name : 'MsSearchResponse',
	#superclass : 'MsResponse',
	#instVars : [
		'indexUid',
		'hits',
		'offset',
		'limit',
		'estimatedTotalHits',
		'totalHits',
		'totalPages',
		'hitsPerPage',
		'page',
		'facetDistribution',
		'facetStats',
		'processingTimeMs',
		'query'
	],
	#category : 'Meilisearch-Core',
	#package : 'Meilisearch-Core'
}

{ #category : 'accessing' }
MsSearchResponse >> estimatedTotalHits [

	^ estimatedTotalHits
]

{ #category : 'accessing' }
MsSearchResponse >> estimatedTotalHits: anObject [

	estimatedTotalHits := anObject
]

{ #category : 'accessing' }
MsSearchResponse >> facetDistribution [

	^ facetDistribution
]

{ #category : 'accessing' }
MsSearchResponse >> facetDistribution: anObject [

	facetDistribution := anObject
]

{ #category : 'accessing' }
MsSearchResponse >> facetStats [

	^ facetStats
]

{ #category : 'accessing' }
MsSearchResponse >> facetStats: anObject [

	facetStats := anObject
]

{ #category : 'accessing' }
MsSearchResponse >> hits [

	^ hits
]

{ #category : 'accessing' }
MsSearchResponse >> hits: anObject [

	hits := anObject
]

{ #category : 'accessing' }
MsSearchResponse >> hitsPerPage [

	^ hitsPerPage
]

{ #category : 'accessing' }
MsSearchResponse >> hitsPerPage: anObject [

	hitsPerPage := anObject
]

{ #category : 'accessing' }
MsSearchResponse >> indexUid [

	^ indexUid
]

{ #category : 'accessing' }
MsSearchResponse >> indexUid: anObject [

	indexUid := anObject
]

{ #category : 'initialization' }
MsSearchResponse >> initFromDictionary: aDictionary [
	aDictionary at: 'indexUid' ifPresent: [ :v | self indexUid: v ].
	aDictionary at: 'hits' ifPresent: [ :v | self hits: v ].
	aDictionary at: 'offset' ifPresent: [ :v | self offset: v asInteger ].
	aDictionary at: 'limit' ifPresent: [ :v | self limit: v asInteger ].
	aDictionary at: 'estimatedTotalHits' ifPresent: [ :v | self estimatedTotalHits: v asInteger ].
	aDictionary at: 'totalHits' ifPresent: [ :v | self totalHits: v asInteger ].
	aDictionary at: 'totalPages' ifPresent: [ :v | self totalPages: v asInteger ].
	aDictionary at: 'hitsPerPage' ifPresent: [ :v | self hitsPerPage: v asInteger ].
	aDictionary at: 'page' ifPresent: [ :v | self page: v asInteger ].
	aDictionary at: 'facetDistribution' ifPresent: [ :v | self facetDistribution: v ].
	aDictionary at: 'facetStats' ifPresent: [ :v | self facetStats: v ].
	aDictionary at: 'processingTimeMs' ifPresent: [ :v | self processingTimeMs: v asInteger ].
	aDictionary at: 'query' ifPresent: [ :v | self query: v ].

]

{ #category : 'accessing' }
MsSearchResponse >> limit [

	^ limit
]

{ #category : 'accessing' }
MsSearchResponse >> limit: anObject [

	limit := anObject
]

{ #category : 'accessing' }
MsSearchResponse >> offset [

	^ offset
]

{ #category : 'accessing' }
MsSearchResponse >> offset: anObject [

	offset := anObject
]

{ #category : 'accessing' }
MsSearchResponse >> page [

	^ page
]

{ #category : 'accessing' }
MsSearchResponse >> page: anObject [

	page := anObject
]

{ #category : 'printing' }
MsSearchResponse >> printOn: aStream [
	super printOn: aStream.
	indexUid ifNotNil: [
		aStream
			nextPutAll: ' indexUid: ';
			print: indexUid].
	aStream
		nextPutAll: ' hits: ';
		print: hits.
	aStream
		nextPutAll: ' offset: ';
		print: offset.
	aStream
		nextPutAll: ' limit: ';
		print: limit.
	aStream
		nextPutAll: ' estimatedTotalHits: ';
		print: estimatedTotalHits.
	aStream
		nextPutAll: ' totalHits: ';
		print: totalHits.
	aStream
		nextPutAll: ' totalPages: ';
		print: totalPages.
	aStream
		nextPutAll: ' hitsPerPage: ';
		print: hitsPerPage.
	aStream
		nextPutAll: ' page: ';
		print: page.
	aStream
		nextPutAll: ' facetDistribution: ';
		print: facetDistribution.
	aStream
		nextPutAll: ' facetStats: ';
		print: facetStats.
	aStream
		nextPutAll: ' processingTimeMs: ';
		print: processingTimeMs.
	aStream
		nextPutAll: ' query: ';
		print: query.

]

{ #category : 'accessing' }
MsSearchResponse >> processingTimeMs [

	^ processingTimeMs
]

{ #category : 'accessing' }
MsSearchResponse >> processingTimeMs: anObject [

	processingTimeMs := anObject
]

{ #category : 'accessing' }
MsSearchResponse >> query [

	^ query
]

{ #category : 'accessing' }
MsSearchResponse >> query: anObject [

	query := anObject
]

{ #category : 'accessing' }
MsSearchResponse >> totalHits [

	^ totalHits
]

{ #category : 'accessing' }
MsSearchResponse >> totalHits: anObject [

	totalHits := anObject
]

{ #category : 'accessing' }
MsSearchResponse >> totalPages [

	^ totalPages
]

{ #category : 'accessing' }
MsSearchResponse >> totalPages: anObject [

	totalPages := anObject
]
