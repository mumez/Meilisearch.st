Class {
	#name : 'MsPhPortableUtil',
	#superclass : 'MsPortableUtil',
	#category : 'Meilisearch-Core-Pharo',
	#package : 'Meilisearch-Core-Pharo'
}

{ #category : 'class initialization' }
MsPhPortableUtil class >> initialize [
	self activate
]

{ #category : 'actions-http-helper' }
MsPhPortableUtil >> createHttpClient [
	| cli |
	cli := ZnClient new.
	^cli
]

{ #category : 'private' }
MsPhPortableUtil >> createHttpJsonClient [
	| cli |
	cli := self createHttpClient.
	cli forJsonREST.
	cli setBearerAuthentication: self settings apiKey.
	^ cli
]

{ #category : 'actions' }
MsPhPortableUtil >> queryParamsStringFrom: aDictionary [
	| strm params |
	aDictionary isEmpty ifTrue: [ ^ '' ].
	strm := '' writeStream.
	strm nextPutAll: '?'.
	params := aDictionary associations inject: Dictionary new into: [ :sum :each | sum at: each key put: each value asString. sum ].
	ZnResourceMetaUtils writeQueryFields: params on: strm.
	^ strm contents
]

{ #category : 'private' }
MsPhPortableUtil >> readJsonFrom: aStream [
	^ STON fromStream: aStream
]
