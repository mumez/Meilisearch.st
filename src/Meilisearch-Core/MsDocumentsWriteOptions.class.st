Class {
	#name : 'MsDocumentsWriteOptions',
	#superclass : 'MsOptions',
	#instVars : [
		'primaryKey',
		'csvDelimiter'
	],
	#category : 'Meilisearch-Core',
	#package : 'Meilisearch-Core'
}

{ #category : 'converting' }
MsDocumentsWriteOptions >> asDictionary [
	| dict |
	dict := Dictionary new.
	self primaryKey ifNotNil: [:v | dict at: 'primaryKey' put: v].
	self csvDelimiter ifNotNil: [:v | dict at: 'csvDelimiter' put: v].
	^ dict
]

{ #category : 'accessing' }
MsDocumentsWriteOptions >> csvDelimiter [

	^ csvDelimiter
]

{ #category : 'accessing' }
MsDocumentsWriteOptions >> csvDelimiter: anObject [

	csvDelimiter := anObject
]

{ #category : 'accessing' }
MsDocumentsWriteOptions >> primaryKey [

	^ primaryKey
]

{ #category : 'accessing' }
MsDocumentsWriteOptions >> primaryKey: anObject [

	primaryKey := anObject
]
