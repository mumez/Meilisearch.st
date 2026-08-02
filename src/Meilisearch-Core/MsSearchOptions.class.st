Class {
	#name : 'MsSearchOptions',
	#superclass : 'MsOptions',
	#instVars : [
		'indexUid',
		'q',
		'offset',
		'limit',
		'hitsPerPage',
		'page',
		'filter',
		'facets',
		'attributesToRetrieve',
		'attributesToCrop',
		'cropLength',
		'cropMarker',
		'attributesToHighlight',
		'highlightPreTag',
		'highlightPostTag',
		'showMatchesPosition',
		'sort',
		'matchingStrategy',
		'showRankingScore',
		'attributesToSearchOn',
		'showRankingScoreDetails',
		'vector',
		'hybrid'
	],
	#category : 'Meilisearch-Core',
	#package : 'Meilisearch-Core'
}

{ #category : 'accessing' }
MsSearchOptions class >> index: indexUid [
	| uid |
	uid := indexUid isString
		       ifTrue: [ indexUid ]
		       ifFalse: [ indexUid uid ].
	^ self indexUid: uid
]

{ #category : 'accessing' }
MsSearchOptions class >> indexUid: indexUid [
	^ self new
		  indexUid: indexUid;
		  yourself
]

{ #category : 'converting' }
MsSearchOptions >> asDictionary [
    | dict |
    dict := Dictionary new.
    self indexUid ifNotNil: [:v | dict at: 'indexUid' put: v].
    self q ifNotNil: [:v | dict at: 'q' put: v].
    self offset ifNotNil: [:v | dict at: 'offset' put: v].
    self limit ifNotNil: [:v | dict at: 'limit' put: v].
    self hitsPerPage ifNotNil: [:v | dict at: 'hitsPerPage' put: v].
    self hybrid ifNotNil: [:v | dict at: 'hybrid' put: v].
    self page ifNotNil: [:v | dict at: 'page' put: v].
    self filter ifNotNil: [:v | dict at: 'filter' put: v].
    self facets ifNotNil: [:v | dict at: 'facets' put: v].
    self attributesToRetrieve ifNotNil: [:v | dict at: 'attributesToRetrieve' put: v].
    self attributesToCrop ifNotNil: [:v | dict at: 'attributesToCrop' put: v].
    self cropLength ifNotNil: [:v | dict at: 'cropLength' put: v].
    self cropMarker ifNotNil: [:v | dict at: 'cropMarker' put: v].
    self attributesToHighlight ifNotNil: [:v | dict at: 'attributesToHighlight' put: v].
    self highlightPreTag ifNotNil: [:v | dict at: 'highlightPreTag' put: v].
    self highlightPostTag ifNotNil: [:v | dict at: 'highlightPostTag' put: v].
    self showMatchesPosition ifNotNil: [:v | dict at: 'showMatchesPosition' put: v].
    self sort ifNotNil: [:v | dict at: 'sort' put: v].
    self matchingStrategy ifNotNil: [:v | dict at: 'matchingStrategy' put: v].
    self showRankingScore ifNotNil: [:v | dict at: 'showRankingScore' put: v].
    self showRankingScoreDetails ifNotNil: [:v | dict at: 'showRankingScoreDetails' put: v].
    self attributesToSearchOn ifNotNil: [:v | dict at: 'attributesToSearchOn' put: v].
    self vector ifNotNil: [:v | dict at: 'vector' put: v].
    ^ dict

]

{ #category : 'accessing' }
MsSearchOptions >> attributesToCrop [

	^ attributesToCrop
]

{ #category : 'accessing' }
MsSearchOptions >> attributesToCrop: anObject [

	attributesToCrop := anObject
]

{ #category : 'accessing' }
MsSearchOptions >> attributesToHighlight [

	^ attributesToHighlight
]

{ #category : 'accessing' }
MsSearchOptions >> attributesToHighlight: anObject [

	attributesToHighlight := anObject
]

{ #category : 'accessing' }
MsSearchOptions >> attributesToRetrieve [

	^ attributesToRetrieve
]

{ #category : 'accessing' }
MsSearchOptions >> attributesToRetrieve: anObject [

	attributesToRetrieve := anObject
]

{ #category : 'accessing' }
MsSearchOptions >> attributesToSearchOn [

	^ attributesToSearchOn
]

{ #category : 'accessing' }
MsSearchOptions >> attributesToSearchOn: anObject [

	attributesToSearchOn := anObject
]

{ #category : 'accessing' }
MsSearchOptions >> cropLength [

	^ cropLength
]

{ #category : 'accessing' }
MsSearchOptions >> cropLength: anObject [

	cropLength := anObject
]

{ #category : 'accessing' }
MsSearchOptions >> cropMarker [

	^ cropMarker
]

{ #category : 'accessing' }
MsSearchOptions >> cropMarker: anObject [

	cropMarker := anObject
]

{ #category : 'accessing - shortcuts' }
MsSearchOptions >> embedder: embedderName semanticRatio: semanticRatio [
	self hybrid: {
			('embedder' -> embedderName).
			('semanticRatio' -> semanticRatio) } asDictionary
]

{ #category : 'accessing' }
MsSearchOptions >> facets [

	^ facets
]

{ #category : 'accessing' }
MsSearchOptions >> facets: anObject [

	facets := anObject
]

{ #category : 'accessing' }
MsSearchOptions >> filter [

	^ filter
]

{ #category : 'accessing' }
MsSearchOptions >> filter: anObject [

	filter := anObject
]

{ #category : 'accessing' }
MsSearchOptions >> highlightPostTag [

	^ highlightPostTag
]

{ #category : 'accessing' }
MsSearchOptions >> highlightPostTag: anObject [

	highlightPostTag := anObject
]

{ #category : 'accessing' }
MsSearchOptions >> highlightPreTag [

	^ highlightPreTag
]

{ #category : 'accessing' }
MsSearchOptions >> highlightPreTag: anObject [

	highlightPreTag := anObject
]

{ #category : 'accessing' }
MsSearchOptions >> hitsPerPage [

	^ hitsPerPage
]

{ #category : 'accessing' }
MsSearchOptions >> hitsPerPage: anObject [

	hitsPerPage := anObject
]

{ #category : 'accessing' }
MsSearchOptions >> hybrid [

	^ hybrid
]

{ #category : 'accessing' }
MsSearchOptions >> hybrid: anObject [

	hybrid := anObject
]

{ #category : 'accessing' }
MsSearchOptions >> indexUid [

	^ indexUid
]

{ #category : 'accessing' }
MsSearchOptions >> indexUid: anObject [

	indexUid := anObject
]

{ #category : 'accessing' }
MsSearchOptions >> limit [

	^ limit
]

{ #category : 'accessing' }
MsSearchOptions >> limit: anObject [

	limit := anObject
]

{ #category : 'accessing' }
MsSearchOptions >> matchingStrategy [

	^ matchingStrategy
]

{ #category : 'accessing' }
MsSearchOptions >> matchingStrategy: anObject [

	matchingStrategy := anObject
]

{ #category : 'accessing' }
MsSearchOptions >> offset [

	^ offset
]

{ #category : 'accessing' }
MsSearchOptions >> offset: anObject [

	offset := anObject
]

{ #category : 'accessing' }
MsSearchOptions >> page [

	^ page
]

{ #category : 'accessing' }
MsSearchOptions >> page: anObject [

	page := anObject
]

{ #category : 'accessing' }
MsSearchOptions >> q [

	^ q
]

{ #category : 'accessing' }
MsSearchOptions >> q: anObject [

	q := anObject
]

{ #category : 'accessing' }
MsSearchOptions >> showMatchesPosition [

	^ showMatchesPosition
]

{ #category : 'accessing' }
MsSearchOptions >> showMatchesPosition: anObject [

	showMatchesPosition := anObject
]

{ #category : 'accessing' }
MsSearchOptions >> showRankingScore [

	^ showRankingScore
]

{ #category : 'accessing' }
MsSearchOptions >> showRankingScore: anObject [

	showRankingScore := anObject
]

{ #category : 'accessing' }
MsSearchOptions >> showRankingScoreDetails [

	^ showRankingScoreDetails
]

{ #category : 'accessing' }
MsSearchOptions >> showRankingScoreDetails: anObject [

	showRankingScoreDetails := anObject
]

{ #category : 'accessing' }
MsSearchOptions >> sort [

	^ sort
]

{ #category : 'accessing' }
MsSearchOptions >> sort: anObject [

	sort := anObject
]

{ #category : 'accessing' }
MsSearchOptions >> vector [

	^ vector
]

{ #category : 'accessing' }
MsSearchOptions >> vector: anObject [

	vector := anObject
]
