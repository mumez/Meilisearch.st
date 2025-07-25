Class {
	#name : 'MsObject',
	#superclass : 'Object',
	#instVars : [
		'settings',
		'client'
	],
	#category : 'Meilisearch-Core',
	#package : 'Meilisearch-Core'
}

{ #category : 'instance creation' }
MsObject class >> fromDictionary: aDictionary [
	| inst |
	inst := self new.
	inst initFromDictionary: aDictionary.
	^ inst
]

{ #category : 'instance creation' }
MsObject class >> settings: msSettings [

	^ self new
		  settings: msSettings;
		  yourself
]

{ #category : 'instance creation' }
MsObject class >> settings: msSettings values: aDictionary [

	^ (self settings: msSettings)
		  initFromDictionary: aDictionary;
		  yourself
]

{ #category : 'responding' }
MsObject >> asTask: aResponce [
	^ MsTask settings: self settings values: aResponce
]

{ #category : 'building' }
MsObject >> buildBaseUrl [
	^ self settings targetUrl
]

{ #category : 'building' }
MsObject >> buildUrl: pathComponents [
	| url |
	url := self portableUtil concatPath: self buildBaseUrl withAll: pathComponents.
	^ url
]

{ #category : 'building' }
MsObject >> buildUrl: pathComponents params: params [
	| url |
	url := self buildUrl: pathComponents.
	url := url , (self portableUtil queryParamsStringFrom: params).
	^ url
]

{ #category : 'accessing' }
MsObject >> client [

	^ client ifNil: [ client := self portableUtil createHttpJsonClient ]
]

{ #category : 'accessing' }
MsObject >> client: anObject [

	client := anObject
]

{ #category : 'requesting' }
MsObject >> httpJsonDelete: pathComponents [
	| url |
	url := self buildUrl: pathComponents.
	^ self portableUtil httpJsonDelete: url on: self client
]

{ #category : 'requesting' }
MsObject >> httpJsonGet: pathComponents [
	^ self httpJsonGet: pathComponents params: #()
]

{ #category : 'requesting' }
MsObject >> httpJsonGet: pathComponents params: params [
	| url |
	url := self buildUrl: pathComponents params: params.
	^ self portableUtil httpJsonGet: url on: self client
]

{ #category : 'requesting' }
MsObject >> httpJsonPatch: pathComponents contents: contents [
	| url |
	url := self buildUrl: pathComponents.
	^ self portableUtil httpJsonPatch: url contents: contents on: self client
]

{ #category : 'requesting' }
MsObject >> httpJsonPost: pathComponents contents: contents [
	| url |
	url := self buildUrl: pathComponents.
	^ self portableUtil httpJsonPost: url contents: contents on: self client
]

{ #category : 'requesting' }
MsObject >> httpJsonPost: pathComponents params: params contents: contents [
	| url |
	url := self buildUrl: pathComponents params: params.
	^ self portableUtil httpJsonPost: url contents: contents on: self client
]

{ #category : 'requesting' }
MsObject >> httpJsonPut: pathComponents contents: contents [
	| url |
	url := self buildUrl: pathComponents.
	^ self portableUtil httpJsonPut: url contents: contents on: self client
]

{ #category : 'requesting' }
MsObject >> httpJsonPut: pathComponents params: params contents: contents [
	| url |
	url := self buildUrl: pathComponents params: params.
	^ self portableUtil httpJsonPut: url contents: contents on: self client
]

{ #category : 'initialization' }
MsObject >> initFromDictionary: aDictionary [
	"implement optionally"
]

{ #category : 'accessing' }
MsObject >> portableUtil [
	^ MsPortableUtil defaultOn: self settings
]

{ #category : 'accessing' }
MsObject >> settings [

	^ settings ifNil: [ settings := MsSettings fromDefault ]
]

{ #category : 'accessing' }
MsObject >> settings: anObject [

	settings := anObject
]
