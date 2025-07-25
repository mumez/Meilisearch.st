Class {
	#name : 'MsPortableUtil',
	#superclass : 'Object',
	#instVars : [
		'settings'
	],
	#classVars : [
		'ActualClass'
	],
	#category : 'Meilisearch-Core',
	#package : 'Meilisearch-Core'
}

{ #category : 'private' }
MsPortableUtil class >> activate [
	ActualClass := self.
	^ActualClass
]

{ #category : 'defaults' }
MsPortableUtil class >> default [
	^ self defaultOn: MsSettings default
]

{ #category : 'defaults' }
MsPortableUtil class >> defaultClass [
	ActualClass ifNil: [ActualClass := ((MsPortableUtil subclasses at: 1) activate)].
	^ ActualClass
]

{ #category : 'defaults' }
MsPortableUtil class >> defaultOn: settings [
	^ self defaultClass new settings: settings; yourself
]

{ #category : 'class initialization' }
MsPortableUtil class >> initialize [
	"override"
]

{ #category : 'actions' }
MsPortableUtil >> concatPath: basePath withAll: pathComponents [
	| strm components base |
	strm := (String new: 64) writeStream.
	components := pathComponents isString
		              ifTrue: [ Array with: pathComponents ]
		              ifFalse: [ pathComponents ].
	base := (basePath endsWith: '/')
		        ifTrue: [ basePath ]
		        ifFalse: [ basePath , '/' ].
	strm nextPutAll: base.
	components
		do: [ :each | strm nextPutAll: each ]
		separatedBy: [ strm nextPutAll: '/' ].
	^ strm contents
]

{ #category : 'private' }
MsPortableUtil >> createHttpJsonClient [
	self subclassResponsibility
]

{ #category : 'actions-http-helper' }
MsPortableUtil >> httpJsonClientDo: aBlock [
	| cli resp |
	cli := self createHttpJsonClient.
	aBlock value: cli.
	resp := self signalErrorFromHttpResponseIfNeeded: cli response.
	^ self readJsonFromResponse: resp
]

{ #category : 'actions-http-helper' }
MsPortableUtil >> httpJsonDelete: urlOrString on: anHttpClient [ 
	^ self httpJsonClientDo: [ :cli | cli delete: urlOrString asString ]
]

{ #category : 'actions-http-helper' }
MsPortableUtil >> httpJsonGet: urlOrString on: anHttpClient [
	^ self httpJsonClientDo: [ :cli | cli get: urlOrString asString ]
]

{ #category : 'actions-http-helper' }
MsPortableUtil >> httpJsonPatch: urlOrString contents: jsonString on: anHttpClient [
	^ self httpJsonClientDo: [ :cli | cli patch: urlOrString asString contents: jsonString ]
]

{ #category : 'actions-http-helper' }
MsPortableUtil >> httpJsonPost: urlOrString contents: jsonString on: anHttpClient [
	^ self httpJsonClientDo: [ :cli | cli post: urlOrString asString contents: jsonString ]
]

{ #category : 'actions-http-helper' }
MsPortableUtil >> httpJsonPut: urlOrString contents: jsonString on: anHttpClient [
	^ self httpJsonClientDo: [ :cli | cli put: urlOrString asString contents: jsonString ]
]

{ #category : 'actions' }
MsPortableUtil >> queryParamsStringFrom: aDictionary [
	| strm |
	aDictionary isEmpty ifTrue: [ ^ '' ].
	strm := '' writeStream.
	strm nextPutAll: '?'.
	aDictionary associations
		do: [ :assoc |
			strm nextPutAll: assoc key asString.
			strm nextPutAll: '='.
			strm nextPutAll: assoc value asString ]
		separatedBy: [ strm nextPutAll: '&' ].
	^ strm contents
]

{ #category : 'private' }
MsPortableUtil >> readJsonFrom: httpResponse [
	self subclassResponsibility
]

{ #category : 'actions-http-helper' }
MsPortableUtil >> readJsonFromResponse: httpResponse [
	| strm |
	strm := httpResponse contents readStream.
	^ self readJsonFrom: strm
]

{ #category : 'accessing' }
MsPortableUtil >> settings [
	^ settings ifNil: [settings := MsSettings default]
]

{ #category : 'accessing' }
MsPortableUtil >> settings: aSettings [
	settings := aSettings 
]

{ #category : 'error handling' }
MsPortableUtil >> signalErrorFromHttpResponseIfNeeded: response [
	| code |
	code := response code.
	(code between: 200 and: 203) ifTrue: [^response].
	^(MsError fromResponse: response) signal
]
