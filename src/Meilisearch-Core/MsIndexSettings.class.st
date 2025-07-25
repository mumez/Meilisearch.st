Class {
	#name : 'MsIndexSettings',
	#superclass : 'MsOptions',
	#instVars : [
		'dictionary',
		'displayedAttributes',
		'distinctAttribute',
		'faceting',
		'filterableAttributes',
		'pagination',
		'rankingRules',
		'searchableAttributes',
		'separatorTokens',
		'nonSeparatorTokens',
		'sortableAttributes',
		'stopWords',
		'synonyms',
		'typoTolerance',
		'facetSearch',
		'embedders'
	],
	#category : 'Meilisearch-Core',
	#package : 'Meilisearch-Core'
}

{ #category : 'converting' }
MsIndexSettings >> asDictionary [
    | dict |
    dict := Dictionary new.
    self dictionary ifNotNil: [:v | dict at: 'dictionary' put: v].
    self displayedAttributes ifNotNil: [:v | dict at: 'displayedAttributes' put: v].
    self distinctAttribute ifNotNil: [:v | dict at: 'distinctAttribute' put: v].
    self embedders ifNotNil: [:v | dict at: 'embedders' put: v].
    self faceting ifNotNil: [:v | dict at: 'faceting' put: v].
    self facetSearch ifNotNil: [:v | dict at: 'facetSearch' put: v].
    self filterableAttributes ifNotNil: [:v | dict at: 'filterableAttributes' put: v].
    self pagination ifNotNil: [:v | dict at: 'pagination' put: v].
    self rankingRules ifNotNil: [:v | dict at: 'rankingRules' put: v].
    self searchableAttributes ifNotNil: [:v | dict at: 'searchableAttributes' put: v].
    self separatorTokens ifNotNil: [:v | dict at: 'separatorTokens' put: v].
    self nonSeparatorTokens ifNotNil: [:v | dict at: 'nonSeparatorTokens' put: v].
    self sortableAttributes ifNotNil: [:v | dict at: 'sortableAttributes' put: v].
    self stopWords ifNotNil: [:v | dict at: 'stopWords' put: v].
    self synonyms ifNotNil: [:v | dict at: 'synonyms' put: v].
    self typoTolerance ifNotNil: [:v | dict at: 'typoTolerance' put: v].
    ^ dict

]

{ #category : 'accessing' }
MsIndexSettings >> dictionary [

	^ dictionary
]

{ #category : 'accessing' }
MsIndexSettings >> dictionary: anObject [

	dictionary := anObject
]

{ #category : 'accessing' }
MsIndexSettings >> displayedAttributes [

	^ displayedAttributes
]

{ #category : 'accessing' }
MsIndexSettings >> displayedAttributes: anObject [

	displayedAttributes := anObject
]

{ #category : 'accessing' }
MsIndexSettings >> distinctAttribute [

	^ distinctAttribute
]

{ #category : 'accessing' }
MsIndexSettings >> distinctAttribute: anObject [

	distinctAttribute := anObject
]

{ #category : 'accessing-embedders' }
MsIndexSettings >> embedderAt: embedderName put: anEmbedderOptions [
	embedders ifNil: [ embedders := Dictionary new ].
	embedderName at: embedderName put: anEmbedderOptions asDictionary
]

{ #category : 'accessing' }
MsIndexSettings >> embedders [

	^ embedders
]

{ #category : 'accessing' }
MsIndexSettings >> embedders: anObject [

	embedders := anObject
]

{ #category : 'accessing' }
MsIndexSettings >> facetSearch [

	^ facetSearch
]

{ #category : 'accessing' }
MsIndexSettings >> facetSearch: anObject [

	facetSearch := anObject
]

{ #category : 'accessing' }
MsIndexSettings >> faceting [

	^ faceting
]

{ #category : 'accessing' }
MsIndexSettings >> faceting: anObject [

	faceting := anObject
]

{ #category : 'accessing' }
MsIndexSettings >> filterableAttributes [

	^ filterableAttributes
]

{ #category : 'accessing' }
MsIndexSettings >> filterableAttributes: anObject [

	filterableAttributes := anObject
]

{ #category : 'initialization' }
MsIndexSettings >> initFromDictionary: aDictionary [
    aDictionary at: 'dictionary' ifPresent: [ :v | self dictionary: v ].
    aDictionary at: 'displayedAttributes' ifPresent: [ :v | self displayedAttributes: v ].
    aDictionary at: 'distinctAttribute' ifPresent: [ :v | self distinctAttribute: v ].
    aDictionary at: 'embedders' ifPresent: [ :v | self embedders: v ].
    aDictionary at: 'faceting' ifPresent: [ :v | self faceting: v ].
    aDictionary at: 'facetSearch' ifPresent: [ :v | self facetSearch: v ].
    aDictionary at: 'filterableAttributes' ifPresent: [ :v | self filterableAttributes: v ].
    aDictionary at: 'pagination' ifPresent: [ :v | self pagination: v ].
    aDictionary at: 'rankingRules' ifPresent: [ :v | self rankingRules: v ].
    aDictionary at: 'searchableAttributes' ifPresent: [ :v | self searchableAttributes: v ].
    aDictionary at: 'separatorTokens' ifPresent: [ :v | self separatorTokens: v ].
    aDictionary at: 'nonSeparatorTokens' ifPresent: [ :v | self nonSeparatorTokens: v ].
    aDictionary at: 'sortableAttributes' ifPresent: [ :v | self sortableAttributes: v ].
    aDictionary at: 'stopWords' ifPresent: [ :v | self stopWords: v ].
    aDictionary at: 'synonyms' ifPresent: [ :v | self synonyms: v ].
    aDictionary at: 'typoTolerance' ifPresent: [ :v | self typoTolerance: v ].

]

{ #category : 'accessing-faceting' }
MsIndexSettings >> maxValuesPerFacet: anInteger [
	| dict |
	dict := self faceting ifNil: [ Dictionary new ].
	dict at: 'maxValuesPerFacet' put: anInteger.
	self faceting: dict
]

{ #category : 'accessing' }
MsIndexSettings >> nonSeparatorTokens [

	^ nonSeparatorTokens
]

{ #category : 'accessing' }
MsIndexSettings >> nonSeparatorTokens: anObject [

	nonSeparatorTokens := anObject
]

{ #category : 'accessing' }
MsIndexSettings >> pagination [

	^ pagination
]

{ #category : 'accessing' }
MsIndexSettings >> pagination: anObject [

	pagination := anObject
]

{ #category : 'accessing' }
MsIndexSettings >> rankingRules [

	^ rankingRules
]

{ #category : 'accessing' }
MsIndexSettings >> rankingRules: anObject [

	rankingRules := anObject
]

{ #category : 'accessing' }
MsIndexSettings >> searchableAttributes [

	^ searchableAttributes
]

{ #category : 'accessing' }
MsIndexSettings >> searchableAttributes: anObject [

	searchableAttributes := anObject
]

{ #category : 'accessing' }
MsIndexSettings >> separatorTokens [

	^ separatorTokens
]

{ #category : 'accessing' }
MsIndexSettings >> separatorTokens: anObject [

	separatorTokens := anObject
]

{ #category : 'accessing-faceting' }
MsIndexSettings >> sortFacetValuesBy: aDictionary [
	| dict |
	dict := self faceting ifNil: [ Dictionary new ].
	dict at: 'sortFacetValuesBy' put: aDictionary.
	self faceting: dict 
]

{ #category : 'accessing' }
MsIndexSettings >> sortableAttributes [

	^ sortableAttributes
]

{ #category : 'accessing' }
MsIndexSettings >> sortableAttributes: anObject [

	sortableAttributes := anObject
]

{ #category : 'accessing' }
MsIndexSettings >> stopWords [

	^ stopWords
]

{ #category : 'accessing' }
MsIndexSettings >> stopWords: anObject [

	stopWords := anObject
]

{ #category : 'accessing' }
MsIndexSettings >> synonyms [

	^ synonyms
]

{ #category : 'accessing' }
MsIndexSettings >> synonyms: anObject [

	synonyms := anObject
]

{ #category : 'accessing' }
MsIndexSettings >> typoTolerance [

	^ typoTolerance
]

{ #category : 'accessing' }
MsIndexSettings >> typoTolerance: anObject [

	typoTolerance := anObject
]
