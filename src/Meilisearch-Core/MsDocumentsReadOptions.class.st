Class {
	#name : 'MsDocumentsReadOptions',
	#superclass : 'MsOptions',
	#instVars : [
		'offset',
		'limit',
		'fields',
		'filter'
	],
	#category : 'Meilisearch-Core',
	#package : 'Meilisearch-Core'
}

{ #category : 'converting' }
MsDocumentsReadOptions >> asDictionary [
	| dict |
	dict := Dictionary new.
	self offset ifNotNil: [:v | dict at: 'offset' put: v].
	self limit ifNotNil: [:v | dict at: 'limit' put: v].
	self fields ifNotNil: [:v | dict at: 'fields' put: v].
	self filter ifNotNil: [:v | dict at: 'filter' put: v].
	^ dict

]

{ #category : 'accessing' }
MsDocumentsReadOptions >> fields [

	^ fields
]

{ #category : 'accessing' }
MsDocumentsReadOptions >> fields: anObject [

	fields := anObject
]

{ #category : 'accessing' }
MsDocumentsReadOptions >> filter [

	^ filter
]

{ #category : 'accessing' }
MsDocumentsReadOptions >> filter: anObject [

	filter := anObject
]

{ #category : 'accessing' }
MsDocumentsReadOptions >> limit [

	^ limit
]

{ #category : 'accessing' }
MsDocumentsReadOptions >> limit: anObject [

	limit := anObject
]

{ #category : 'accessing' }
MsDocumentsReadOptions >> offset [

	^ offset
]

{ #category : 'accessing' }
MsDocumentsReadOptions >> offset: anObject [

	offset := anObject
]
