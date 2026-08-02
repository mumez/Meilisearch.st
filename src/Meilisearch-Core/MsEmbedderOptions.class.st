Class {
	#name : 'MsEmbedderOptions',
	#superclass : 'MsOptions',
	#instVars : [
		'source',
		'url',
		'apiKey',
		'model',
		'documentTemplate',
		'documentTemplateMaxBytes',
		'dimensions',
		'revision',
		'distribution',
		'request',
		'response',
		'binaryQuantized',
		'indexingEmbedder',
		'searchEmbedder',
		'pooling'
	],
	#category : 'Meilisearch-Core',
	#package : 'Meilisearch-Core'
}

{ #category : 'accessing' }
MsEmbedderOptions >> apiKey [

	^ apiKey
]

{ #category : 'accessing' }
MsEmbedderOptions >> apiKey: anObject [

	apiKey := anObject
]

{ #category : 'converting' }
MsEmbedderOptions >> asDictionary [
	| dict |
	dict := Dictionary new.
	self source ifNotNil: [:v | dict at: 'source' put: v].
	self url ifNotNil: [:v | dict at: 'url' put: v].
	self apiKey ifNotNil: [:v | dict at: 'apiKey' put: v].
	self model ifNotNil: [:v | dict at: 'model' put: v].
	self documentTemplate ifNotNil: [:v | dict at: 'documentTemplate' put: v].
	self documentTemplateMaxBytes ifNotNil: [:v | dict at: 'documentTemplateMaxBytes' put: v].
	self dimensions ifNotNil: [:v | dict at: 'dimensions' put: v].
	self revision ifNotNil: [:v | dict at: 'revision' put: v].
	self distribution ifNotNil: [:v | dict at: 'distribution' put: v].
	self request ifNotNil: [:v | dict at: 'request' put: v].
	self response ifNotNil: [:v | dict at: 'response' put: v].
	self binaryQuantized ifNotNil: [:v | dict at: 'binaryQuantized' put: v].
	self indexingEmbedder ifNotNil: [:v | dict at: 'indexingEmbedder' put: v].
	self searchEmbedder ifNotNil: [:v | dict at: 'searchEmbedder' put: v].
	self pooling ifNotNil: [:v | dict at: 'pooling' put: v].
	^ dict
]

{ #category : 'accessing' }
MsEmbedderOptions >> binaryQuantized [

	^ binaryQuantized
]

{ #category : 'accessing' }
MsEmbedderOptions >> binaryQuantized: anObject [

	binaryQuantized := anObject
]

{ #category : 'accessing' }
MsEmbedderOptions >> dimensions [

	^ dimensions
]

{ #category : 'accessing' }
MsEmbedderOptions >> dimensions: anObject [

	dimensions := anObject
]

{ #category : 'accessing' }
MsEmbedderOptions >> distribution [

	^ distribution
]

{ #category : 'accessing' }
MsEmbedderOptions >> distribution: anObject [

	distribution := anObject
]

{ #category : 'accessing' }
MsEmbedderOptions >> documentTemplate [

	^ documentTemplate
]

{ #category : 'accessing' }
MsEmbedderOptions >> documentTemplate: anObject [

	documentTemplate := anObject
]

{ #category : 'accessing' }
MsEmbedderOptions >> documentTemplateMaxBytes [

	^ documentTemplateMaxBytes
]

{ #category : 'accessing' }
MsEmbedderOptions >> documentTemplateMaxBytes: anObject [

	documentTemplateMaxBytes := anObject
]

{ #category : 'shortcuts' }
MsEmbedderOptions >> huggingFace [
	self source: 'huggingFace'
]

{ #category : 'accessing' }
MsEmbedderOptions >> indexingEmbedder [

	^ indexingEmbedder
]

{ #category : 'accessing' }
MsEmbedderOptions >> indexingEmbedder: anObject [

	indexingEmbedder := anObject
]

{ #category : 'initialization' }
MsEmbedderOptions >> initFromDictionary: aDictionary [
	aDictionary at: 'source' ifPresent: [ :v | self source: v ].
	aDictionary at: 'url' ifPresent: [ :v | self url: v ].
	aDictionary at: 'apiKey' ifPresent: [ :v | self apiKey: v ].
	aDictionary at: 'model' ifPresent: [ :v | self model: v ].
	aDictionary at: 'documentTemplate' ifPresent: [ :v | self documentTemplate: v ].
	aDictionary at: 'documentTemplateMaxBytes' ifPresent: [ :v | self documentTemplateMaxBytes: v ].
	aDictionary at: 'dimensions' ifPresent: [ :v | self dimensions: v ].
	aDictionary at: 'revision' ifPresent: [ :v | self revision: v ].
	aDictionary at: 'distribution' ifPresent: [ :v | self distribution: v ].
	aDictionary at: 'request' ifPresent: [ :v | self request: v ].
	aDictionary at: 'response' ifPresent: [ :v | self response: v ].
	aDictionary at: 'binaryQuantized' ifPresent: [ :v | self binaryQuantized: v ].
	aDictionary at: 'indexingEmbedder' ifPresent: [ :v | self indexingEmbedder: v ].
	aDictionary at: 'searchEmbedder' ifPresent: [ :v | self searchEmbedder: v ].
	aDictionary at: 'pooling' ifPresent: [ :v | self pooling: v ].
]

{ #category : 'accessing' }
MsEmbedderOptions >> model [

	^ model
]

{ #category : 'accessing' }
MsEmbedderOptions >> model: anObject [

	model := anObject
]

{ #category : 'shortcuts' }
MsEmbedderOptions >> ollama [
	self source: 'ollama'
]

{ #category : 'shortcuts' }
MsEmbedderOptions >> openAi [
	self source: 'openAi'
]

{ #category : 'accessing' }
MsEmbedderOptions >> pooling [

	^ pooling
]

{ #category : 'accessing' }
MsEmbedderOptions >> pooling: anObject [

	pooling := anObject
]

{ #category : 'accessing' }
MsEmbedderOptions >> request [

	^ request
]

{ #category : 'accessing' }
MsEmbedderOptions >> request: anObject [

	request := anObject
]

{ #category : 'accessing' }
MsEmbedderOptions >> response [

	^ response
]

{ #category : 'accessing' }
MsEmbedderOptions >> response: anObject [

	response := anObject
]

{ #category : 'shortcuts' }
MsEmbedderOptions >> rest [
	self source: 'rest'
]

{ #category : 'accessing' }
MsEmbedderOptions >> revision [

	^ revision
]

{ #category : 'accessing' }
MsEmbedderOptions >> revision: anObject [

	revision := anObject
]

{ #category : 'accessing' }
MsEmbedderOptions >> searchEmbedder [

	^ searchEmbedder
]

{ #category : 'accessing' }
MsEmbedderOptions >> searchEmbedder: anObject [

	searchEmbedder := anObject
]

{ #category : 'accessing' }
MsEmbedderOptions >> source [

	^ source
]

{ #category : 'accessing' }
MsEmbedderOptions >> source: anObject [

	source := anObject
]

{ #category : 'accessing' }
MsEmbedderOptions >> url [

	^ url
]

{ #category : 'accessing' }
MsEmbedderOptions >> url: anObject [

	url := anObject
]

{ #category : 'shortcuts' }
MsEmbedderOptions >> userProvided [
	self source: 'userProvided'
]
