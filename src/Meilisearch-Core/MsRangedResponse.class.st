Class {
	#name : 'MsRangedResponse',
	#superclass : 'MsResponse',
	#instVars : [
		'limit',
		'total',
		'results',
		'offset'
	],
	#category : 'Meilisearch-Core',
	#package : 'Meilisearch-Core'
}

{ #category : 'initialization' }
MsRangedResponse >> initFromDictionary: aDictionary [
	aDictionary at: 'limit' ifPresent: [ :v | self limit: v asInteger ].
	aDictionary at: 'total' ifPresent: [ :v | self total: v asInteger ].
	aDictionary at: 'results' ifPresent: [ :v | self results: v ].
	aDictionary at: 'offset' ifPresent: [ :v | self offset: v asInteger ].

]

{ #category : 'accessing' }
MsRangedResponse >> limit [

	^ limit
]

{ #category : 'accessing' }
MsRangedResponse >> limit: anObject [

	limit := anObject
]

{ #category : 'accessing' }
MsRangedResponse >> offset [

	^ offset
]

{ #category : 'accessing' }
MsRangedResponse >> offset: anObject [

	offset := anObject
]

{ #category : 'printing' }
MsRangedResponse >> printOn: aStream [
	super printOn: aStream.
	aStream
		nextPutAll: ' results: ';
		print: results.
	aStream
		nextPutAll: ' offset: ';
		print: offset.
	aStream
		nextPutAll: ' limit: ';
		print: limit.
	aStream
		nextPutAll: ' total: ';
		print: total
]

{ #category : 'accessing' }
MsRangedResponse >> results [

	^ results
]

{ #category : 'accessing' }
MsRangedResponse >> results: anObject [

	results := anObject
]

{ #category : 'accessing' }
MsRangedResponse >> total [

	^ total
]

{ #category : 'accessing' }
MsRangedResponse >> total: anObject [

	total := anObject
]
