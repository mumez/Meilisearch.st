Class {
	#name : 'MsFacetSearchOptions',
	#superclass : 'MsOptions',
	#instVars : [
		'facetName',
		'facetQuery',
		'q',
		'filter',
		'matchingStrategy',
		'attributesToSearchOn'
	],
	#category : 'Meilisearch-Core',
	#package : 'Meilisearch-Core'
}

{ #category : 'converting' }
MsFacetSearchOptions >> asDictionary [
    | dict |
    dict := Dictionary new.
    self facetName ifNotNil: [:v | dict at: 'facetName' put: v].
    self facetQuery ifNotNil: [:v | dict at: 'facetQuery' put: v].
    self q ifNotNil: [:v | dict at: 'q' put: v].
    self filter ifNotNil: [:v | dict at: 'filter' put: v].
    self matchingStrategy ifNotNil: [:v | dict at: 'matchingStrategy' put: v].
    self attributesToSearchOn ifNotNil: [:v | dict at: 'attributesToSearchOn' put: v].
    ^ dict

]

{ #category : 'accessing' }
MsFacetSearchOptions >> attributesToSearchOn [

	^ attributesToSearchOn
]

{ #category : 'accessing' }
MsFacetSearchOptions >> attributesToSearchOn: anObject [

	attributesToSearchOn := anObject
]

{ #category : 'accessing' }
MsFacetSearchOptions >> facetName [

	^ facetName
]

{ #category : 'accessing' }
MsFacetSearchOptions >> facetName: anObject [

	facetName := anObject
]

{ #category : 'accessing' }
MsFacetSearchOptions >> facetQuery [

	^ facetQuery
]

{ #category : 'accessing' }
MsFacetSearchOptions >> facetQuery: anObject [

	facetQuery := anObject
]

{ #category : 'accessing' }
MsFacetSearchOptions >> filter [

	^ filter
]

{ #category : 'accessing' }
MsFacetSearchOptions >> filter: anObject [

	filter := anObject
]

{ #category : 'accessing' }
MsFacetSearchOptions >> matchingStrategy [

	^ matchingStrategy
]

{ #category : 'accessing' }
MsFacetSearchOptions >> matchingStrategy: anObject [

	matchingStrategy := anObject
]

{ #category : 'accessing' }
MsFacetSearchOptions >> q [

	^ q
]

{ #category : 'accessing' }
MsFacetSearchOptions >> q: anObject [

	q := anObject
]
