Class {
	#name : 'MsIndex',
	#superclass : 'MsObject',
	#instVars : [
		'uid',
		'createdAt',
		'updatedAt',
		'primaryKey',
		'defaultSearchOptionsBuilder'
	],
	#category : 'Meilisearch-Core',
	#package : 'Meilisearch-Core'
}

{ #category : 'index-settings' }
MsIndex >> applySettings: options [
	^ self asTask: (self httpJsonPatch: 'settings' contents: options)
]

{ #category : 'index-settings' }
MsIndex >> applySettingsUsing: optionsBuilder [
	| options |
	options := MsIndexSettings new.
	optionsBuilder value: options.
	^ self applySettings: options asDictionary.
]

{ #category : 'building' }
MsIndex >> buildBaseUrl [
	^ self portableUtil concatPath: super buildBaseUrl withAll: (Array with: 'indexes' with: self uid).
]

{ #category : 'accessing' }
MsIndex >> createdAt [

	^ createdAt
]

{ #category : 'accessing' }
MsIndex >> createdAt: anObject [

	createdAt := anObject
]

{ #category : 'accessing' }
MsIndex >> defaultSearchOptionsBuilder [
	^ defaultSearchOptionsBuilder ifNil: [
		  defaultSearchOptionsBuilder := [ :opts | opts ] ]
]

{ #category : 'accessing' }
MsIndex >> defaultSearchOptionsBuilder: anObject [

	defaultSearchOptionsBuilder := anObject
]

{ #category : 'searching' }
MsIndex >> defaultSearchOptionsUsing: optionsBuilder [
	self defaultSearchOptionsBuilder: optionsBuilder
]

{ #category : 'actions' }
MsIndex >> delete [
	^ self asTask: (self httpJsonDelete: '')
]

{ #category : 'actions-documents' }
MsIndex >> deleteAllDocuments [
	^ self asTask: (self httpJsonDelete: 'documents')
]

{ #category : 'actions-documents' }
MsIndex >> deleteDocumentAt: documentId [
	| resp |
	resp := self httpJsonDelete: (Array with: 'documents' with: documentId asString).
	^ self asTask: resp
]

{ #category : 'actions-documents' }
MsIndex >> deleteDocumentsBy: filter [
	| conts |
	conts := { ('filter' -> filter) } asDictionary.
	^ self asTask:
		  (self httpJsonPost: #( 'documents' 'delete' ) contents: conts)
]

{ #category : 'searching-facet' }
MsIndex >> facetSearchUsing: optionsBuilder [
	| opts |
	opts := MsFacetSearchOptions new.
	optionsBuilder value: opts.
	^ self facetSearchWithOptions: opts asDictionary
]

{ #category : 'searching-facet' }
MsIndex >> facetSearchWithOptions: options [
	| resp |
	resp := self httpJsonPost: 'facet-search' contents: options.
	^ MsFacetSearchResponse fromDictionary: resp
]

{ #category : 'actions-documents' }
MsIndex >> getAllDocuments [
	^ self getDocuments: Dictionary new
]

{ #category : 'index-settings' }
MsIndex >> getAllSettings [
	| resp |
	resp := self httpJsonGet: 'settings'.
	^ MsIndexSettings fromDictionary: resp
]

{ #category : 'actions-documents' }
MsIndex >> getDocumentAt: documentId [
	^ self httpJsonGet: (Array with: 'documents' with: documentId asString)
]

{ #category : 'actions-documents' }
MsIndex >> getDocuments: opts [
	| resp |
	resp := self httpJsonPost: #('documents' 'fetch') contents: opts.
	^ MsRangedResponse fromDictionary: resp
]

{ #category : 'actions-documents' }
MsIndex >> getDocumentsBy: filter offset: offset limit: limit [
	^ self getDocumentsUsing: [ :opts |
		  opts
			  offset: offset;
			  limit: limit.

		  (filter isNil or: [ filter isEmpty ]) ifFalse: [
			  opts filter: filter ] ]
]

{ #category : 'actions-documents' }
MsIndex >> getDocumentsUsing: optionsBuilder [
	| opts |
	opts := MsDocumentsReadOptions new.
	optionsBuilder value: opts.
	^ self getDocuments: opts asDictionary
]

{ #category : 'searching-hybrid' }
MsIndex >> hybridSearch: query embedder: embedderName semanticRatio: semanticRatio [
	^ self hybridSearch: query embedder: embedderName semanticRatio: semanticRatio optionsUsing: nil
]

{ #category : 'searching-hybrid' }
MsIndex >> hybridSearch: query embedder: embedderName semanticRatio: semanticRatio optionsUsing: optionsBuilder [
	^ self hybridSearch: query vector: nil embedder: embedderName semanticRatio: semanticRatio optionsUsing: optionsBuilder
]

{ #category : 'searching-hybrid' }
MsIndex >> hybridSearch: query vector: vector embedder: embedderName semanticRatio: semanticRatio [
	^ self hybridSearch: query vector: vector embedder: embedderName semanticRatio: semanticRatio optionsUsing: nil
]

{ #category : 'searching-hybrid' }
MsIndex >> hybridSearch: query vector: vector embedder: embedderName semanticRatio: semanticRatio optionsUsing: optionsBuilder [
	^ self searchUsing: [ :opts |
		  opts
			  q: query;
			  embedder: embedderName semanticRatio: semanticRatio.
		  vector ifNotNil: [ opts vector: vector ].
		  optionsBuilder ifNotNil: [ optionsBuilder value: opts ] ]
]

{ #category : 'initialization' }
MsIndex >> initFromDictionary: aDictionary [
	aDictionary at: 'uid' ifPresent: [ :v | self uid: v ].
	aDictionary at: 'primaryKey' ifPresent: [ :v | self primaryKey: v ].
	aDictionary
		at: 'createdAt'
		ifPresent: [ :v | v ifNotNil: [  
		self createdAt: (DateAndTime readFrom: v readStream)] ].
	aDictionary
		at: 'updatedAt'
		ifPresent: [ :v | v ifNotNil: [  
		self updatedAt: (DateAndTime readFrom: v readStream)] ].
]

{ #category : 'loading' }
MsIndex >> loaded [
	| resp |
	resp := self httpJsonGet: ''.
	self initFromDictionary: resp.
]

{ #category : 'actions-documents' }
MsIndex >> mergeDocuments: documents [
	^ self mergeDocuments: documents options: #()
]

{ #category : 'actions-documents' }
MsIndex >> mergeDocuments: documents options: optionsDict [
	| resp |
	resp := self httpJsonPut: 'documents' params: optionsDict contents: documents.
	^ self asTask: resp
]

{ #category : 'actions-documents' }
MsIndex >> mergeDocuments: documents optionsUsing: optionsBuilder [
	| opts |
	opts := MsDocumentsWriteOptions new.
	optionsBuilder value: opts.
	^ self mergeDocuments: documents options: opts asDictionary
]

{ #category : 'accessing' }
MsIndex >> primaryKey [

	^ primaryKey
]

{ #category : 'accessing' }
MsIndex >> primaryKey: anObject [

	primaryKey := anObject
]

{ #category : 'printing' }
MsIndex >> printOn: aStream [
	super printOn: aStream.
	aStream
		nextPutAll: ' uid: ';
		print: uid.
	aStream
		nextPutAll: ' primaryKey: ';
		print: primaryKey.
	aStream
		nextPutAll: ' createdAt: ';
		print: createdAt.
	aStream
		nextPutAll: ' updatedAt: ';
		print: updatedAt
]

{ #category : 'actions-documents' }
MsIndex >> putDocuments: documents [
	^ self putDocuments: documents options: #()
]

{ #category : 'actions-documents' }
MsIndex >> putDocuments: documents options: optionsDict [
	| resp |
	resp := self httpJsonPost: 'documents' params: optionsDict contents: documents.
	^ self asTask: resp
]

{ #category : 'actions-documents' }
MsIndex >> putDocuments: documents optionsUsing: optionsBuilder [
	| opts |
	opts := MsDocumentsWriteOptions new.
	optionsBuilder value: opts.
	^ self putDocuments: documents options: opts asDictionary
]

{ #category : 'embedder-settings' }
MsIndex >> removeEmbedder: embedderName [ 
	| allEmbedderOptions |
	allEmbedderOptions := Dictionary new.
	allEmbedderOptions at: embedderName put: nil.
	^ self setEmbedders: allEmbedderOptions
]

{ #category : 'index-settings' }
MsIndex >> resetSettings [
	^ self asTask: (self httpJsonDelete: 'settings')
]

{ #category : 'searching' }
MsIndex >> search: query [
	^ self searchUsing: [:opts | opts q: query]
]

{ #category : 'searching' }
MsIndex >> search: query offset: offset limit: limit [
	^ self searchUsing: [ :opts |
		  opts
			  q: query;
			  offset: offset;
			  limit: limit ]
]

{ #category : 'searching' }
MsIndex >> search: query optionsUsing: optionsBuilder [
	^ self searchUsing: [ :opts |
		  opts q: query.
		  optionsBuilder value: opts ]
]

{ #category : 'searching-basic' }
MsIndex >> searchUsing: optionsBuilder [
	| opts |
	opts := MsSearchOptions new.
	self defaultSearchOptionsBuilder value: opts.
	optionsBuilder value: opts.
	^ self searchWithOptions: opts asDictionary
]

{ #category : 'searching-basic' }
MsIndex >> searchWithOptions: options [
	| resp |
	resp := self httpJsonPost: 'search' contents: options.
	^ MsSearchResponse fromDictionary: resp
]

{ #category : 'index-settings' }
MsIndex >> setDictionary: keys [
	^ self applySettingsUsing: [ :opts |
		  opts dictionary: keys ]
]

{ #category : 'index-settings' }
MsIndex >> setDisplayedAttributes: attributeNames [
	^ self applySettingsUsing: [ :opts |
		  opts displayedAttributes: attributeNames ]
]

{ #category : 'index-settings' }
MsIndex >> setDistinctAttribute: distinctAttribute [
	^ self applySettingsUsing: [ :opts |
		  opts distinctAttribute: distinctAttribute ]
]

{ #category : 'embedder-settings' }
MsIndex >> setEmbedder: embedderName using: optionsBuilder [
	| options allEmbedderOptions |
	options := MsEmbedderOptions new.
	optionsBuilder value: options.
	allEmbedderOptions := Dictionary new.
	allEmbedderOptions at: embedderName put: options asDictionary.
	^ self setEmbedders: allEmbedderOptions
]

{ #category : 'embedder-settings' }
MsIndex >> setEmbedders: aDictionary [
	^ self applySettingsUsing: [ :opts |
		  opts embedders: aDictionary ]
]

{ #category : 'index-settings' }
MsIndex >> setFilterableAttributes: attributeNames [
	^ self applySettingsUsing: [ :opts |
		  opts filterableAttributes: attributeNames ]
]

{ #category : 'index-settings' }
MsIndex >> setMaxTotalHits: anInteger [
	^ self applySettingsUsing: [ :opts |
		  opts pagination: { ('maxTotalHits' -> anInteger) } asDictionary ]
]

{ #category : 'index-settings' }
MsIndex >> setMaxValuesPerFacet: anInteger [
	^ self applySettingsUsing: [ :opts |
		  opts faceting: { ('maxValuesPerFacet' -> anInteger) } asDictionary ]
]

{ #category : 'index-settings' }
MsIndex >> setNonSeparatorTokens: nonSeparatorTokens [
	^ self applySettingsUsing: [ :opts |
		  opts nonSeparatorTokens: nonSeparatorTokens ]
]

{ #category : 'index-settings' }
MsIndex >> setRankingRules: rankingRules [
	^ self applySettingsUsing: [ :opts |
		  opts rankingRules: rankingRules ]
]

{ #category : 'index-settings' }
MsIndex >> setSearchableAttributes: attributeNames [
	^ self applySettingsUsing: [ :opts |
		  opts searchableAttributes: attributeNames ]
]

{ #category : 'index-settings' }
MsIndex >> setSeparatorTokens: separatorTokens [
	^ self applySettingsUsing: [ :opts |
		  opts separatorTokens: separatorTokens ]
]

{ #category : 'index-settings' }
MsIndex >> setSortableAttributes: attributeNames [
	^ self applySettingsUsing: [ :opts |
		  opts sortableAttributes: attributeNames ]
]

{ #category : 'index-settings' }
MsIndex >> setStopWords: stopWords [
	^ self applySettingsUsing: [ :opts |
		  opts stopWords: stopWords ]
]

{ #category : 'index-settings' }
MsIndex >> setSynonyms: aDictionary [
	^ self applySettingsUsing: [ :opts |
		  opts synonyms: aDictionary ]
]

{ #category : 'index-settings' }
MsIndex >> setTypoTolerance: aDictionary [
	^ self applySettingsUsing: [ :opts |
		  opts typoTolerance: aDictionary ]
]

{ #category : 'accessing' }
MsIndex >> uid [

	^ uid
]

{ #category : 'accessing' }
MsIndex >> uid: anObject [

	uid := anObject
]

{ #category : 'actions' }
MsIndex >> update: options [
	^ self asTask: (self httpJsonPatch: '' contents: options)
]

{ #category : 'actions' }
MsIndex >> updatePrimaryKey: newPrimaryKey [
	| opts |
	opts := { ('primaryKey' -> newPrimaryKey) } asDictionary.
	^ self update: opts
]

{ #category : 'accessing' }
MsIndex >> updatedAt [

	^ updatedAt
]

{ #category : 'accessing' }
MsIndex >> updatedAt: anObject [

	updatedAt := anObject
]

{ #category : 'searching-hybrid' }
MsIndex >> vectorSearch: vector embedder: embedderName [
	^ self vectorSearch: vector embedder: embedderName  optionsUsing: nil
]

{ #category : 'searching-hybrid' }
MsIndex >> vectorSearch: vector embedder: embedderName  optionsUsing: optionsBuilder [
	^ self hybridSearch: nil vector: vector embedder: embedderName semanticRatio: 1 optionsUsing: optionsBuilder
]
