Class {
	#name : 'MeiliSearch',
	#superclass : 'MsObject',
	#instVars : [
		'defaultSearchOptionsBuilder'
	],
	#category : 'Meilisearch-Core',
	#package : 'Meilisearch-Core'
}

{ #category : 'instance creation' }
MeiliSearch class >> apiKey: apiKey [
	| inst |
	inst := self new.
	inst settings apiKey: apiKey.
	^ inst
]

{ #category : 'instance creation' }
MeiliSearch class >> apiKey: apiKey url: targetUrl [
	| inst |
	inst := self apiKey: apiKey.
	inst settings targetUrl: targetUrl.
	^ inst
]

{ #category : 'instance creation' }
MeiliSearch class >> default [
	^ self new
		  settings: MsSettings default;
		  yourself
]

{ #category : 'actions' }
MeiliSearch >> createIndex: indexUid [
	^ self
		  createIndex: indexUid
		  options: Dictionary new
]

{ #category : 'actions' }
MeiliSearch >> createIndex: indexUid options: indexOptions [
	| conts |
	conts := { 'uid' -> indexUid } asDictionary.
	indexOptions keysAndValuesDo: [ :k :v |
		conts at: k put: v 
	].
	^ self asTask: (self httpJsonPost: 'indexes' contents: conts)
]

{ #category : 'actions' }
MeiliSearch >> createIndex: indexUid primaryKey: primaryKey [
	^ self
		  createIndex: indexUid
		  options: { ('primaryKey' -> primaryKey) } asDictionary
]

{ #category : 'actions' }
MeiliSearch >> dumps [
	^ self asTask: (self httpJsonPost: 'dumps' contents: '')
]

{ #category : 'actions' }
MeiliSearch >> experimentalFeatures [
	| resp |
	resp := self httpJsonGet: 'experimental-features'.
	^ MsExperimentalFeatureOptions fromDictionary: resp
	
]

{ #category : 'actions' }
MeiliSearch >> experimentalFeaturesUsing: optionsBuilder [
	| opts |
	opts := MsExperimentalFeatureOptions new.
	optionsBuilder value: opts.
	^ self experimentalFeaturesWithOptions: opts asDictionary 
	
]

{ #category : 'actions' }
MeiliSearch >> experimentalFeaturesWithOptions: options [
	^ self httpJsonPatch: 'experimental-features' contents: options
]

{ #category : 'actions' }
MeiliSearch >> health [
	| resp |
	resp := self httpJsonGet: 'health'.
	^ resp at: 'status' ifAbsent: [ 'unknown' ]
]

{ #category : 'actions' }
MeiliSearch >> index: indexUid [
	^ (MsIndex settings: self settings) uid: indexUid 
]

{ #category : 'actions' }
MeiliSearch >> indexes [
	^ self indexesWithOptions: Dictionary new
]

{ #category : 'actions' }
MeiliSearch >> indexesOffset: offset limit: limit [
	| opts |
	opts := {'offset'->offset. 'limit'->limit  } asDictionary.
	^ self indexesWithOptions: opts
]

{ #category : 'actions' }
MeiliSearch >> indexesWithOptions: options [
	| resp |
	resp := self httpJsonGet: 'indexes' params: options.
	resp at: 'results' ifPresent: [ :results |
		| indexes |
		indexes := results collect: [ :each | MsIndex settings: self settings values: each].
		resp at: 'results' put: indexes ].
	^ MsRangedResponse fromDictionary: resp
]

{ #category : 'actions' }
MeiliSearch >> keys [
	| resp |
	resp := self httpJsonGet: 'keys'.
	^ MsRangedResponse fromDictionary: resp
]

{ #category : 'searching' }
MeiliSearch >> multiSearch: queries [
	| conts resp |
	conts := Dictionary new.
	conts at: 'queries' put: (queries asArray collect: [:each | each asDictionary]).
	resp := self httpJsonPost: {'multi-search'} contents: conts.
	^ resp at: 'results' ifPresent: [ :col | col collect: [ :each | MsSearchResponse fromDictionary: each ] ]
]

{ #category : 'searching' }
MeiliSearch >> multiSearchUsing: queriesBuilder [
	| queries |
	queries := queriesBuilder value: MsSearchOptions.
	^ self multiSearch: queries
]

{ #category : 'actions' }
MeiliSearch >> stats [
	^ self httpJsonGet: 'stats'
]

{ #category : 'actions' }
MeiliSearch >> swapIndex: indexA with: indexB [
	^ self swapIndexes: { {indexA. indexB } }
]

{ #category : 'actions' }
MeiliSearch >> swapIndexes: swappingIndexPairs [
	| conts |
	conts := Dictionary new.
	conts at: 'indexes' put: swappingIndexPairs.
	^ self httpJsonPost: {'indexes'. 'swap'} contents: conts
]

{ #category : 'actions' }
MeiliSearch >> task: taskUid [
	^ (MsTask settings: self settings) uid: taskUid 
]

{ #category : 'actions' }
MeiliSearch >> tasks [
	^ self tasksWithOptions: Dictionary new
]

{ #category : 'actions' }
MeiliSearch >> tasksUsing: optionsBuilder [
	| opts |
	opts := MsTasksReadOptions new.
	optionsBuilder value: opts.
	^ self tasksWithOptions: opts asDictionary
]

{ #category : 'actions' }
MeiliSearch >> tasksWithOptions: options [
	| resp |
	resp := self httpJsonGet: 'tasks' params: options.
	resp at: 'results' ifPresent: [ :results |
		| indexes |
		indexes := results collect: [ :each | MsTask settings: self settings values: each].
		resp at: 'results' put: indexes ].
	^ resp
]

{ #category : 'actions' }
MeiliSearch >> version [
	^ self httpJsonGet: 'version'
]
