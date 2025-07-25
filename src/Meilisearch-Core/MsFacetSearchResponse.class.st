Class {
	#name : 'MsFacetSearchResponse',
	#superclass : 'MsResponse',
	#instVars : [
		'facetHits',
		'facetQuery',
		'processingTimeMs'
	],
	#category : 'Meilisearch-Core',
	#package : 'Meilisearch-Core'
}

{ #category : 'accessing' }
MsFacetSearchResponse >> facetHits [

	^ facetHits
]

{ #category : 'accessing' }
MsFacetSearchResponse >> facetHits: anObject [

	facetHits := anObject
]

{ #category : 'accessing' }
MsFacetSearchResponse >> facetQuery [

	^ facetQuery
]

{ #category : 'accessing' }
MsFacetSearchResponse >> facetQuery: anObject [

	facetQuery := anObject
]

{ #category : 'initialization' }
MsFacetSearchResponse >> initFromDictionary: aDictionary [
    aDictionary at: 'facetHits' ifPresent: [ :v | self facetHits: v ].
    aDictionary at: 'facetQuery' ifPresent: [ :v | self facetQuery: v ].
    aDictionary at: 'processingTimeMs' ifPresent: [ :v | self processingTimeMs: v ].

]

{ #category : 'printing' }
MsFacetSearchResponse >> printOn: aStream [
    super printOn: aStream.
    aStream
        nextPutAll: ' facetHits: ';
        print: facetHits;
        nextPutAll: ' facetQuery: ';
        print: facetQuery;
        nextPutAll: ' processingTimeMs: ';
        print: processingTimeMs.

]

{ #category : 'accessing' }
MsFacetSearchResponse >> processingTimeMs [

	^ processingTimeMs
]

{ #category : 'accessing' }
MsFacetSearchResponse >> processingTimeMs: anObject [

	processingTimeMs := anObject
]
