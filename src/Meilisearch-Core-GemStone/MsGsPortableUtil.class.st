Class {
	#name : 'MsGsPortableUtil',
	#superclass : 'MsPortableUtil',
	#category : 'Meilisearch-Core-GemStone',
	#package : 'Meilisearch-Core-GemStone'
}

{ #category : 'class initialization' }
MsGsPortableUtil class >> initialize [
	self activate
]

{ #category : 'actions-http-helper' }
MsGsPortableUtil >> createHttpClient [
	| cli |
	cli := ZnClient new.
	^cli
]

{ #category : 'private' }
MsGsPortableUtil >> createHttpJsonClient [
	| cli |
  cli := self createHttpClient.
  cli accept: ZnMimeType applicationJson.
  cli
    contentWriter: [ :o | 
      (ZnStringEntity type: ZnMimeType applicationJson)
        string: (self jsonStringFrom: o) ].
  cli request setAuthorization: 'Bearer ' , self settings apiKey.
  ^ cli
]

{ #category : 'actions-http-helper' }
MsGsPortableUtil >> httpJsonPatch: urlOrString contents: jsonString on: anHttpClient [
  ^ self
    httpJsonClientDo: [ :cli | 
      cli
        url: urlOrString asString;
        contents: jsonString;
        method: #'PATCH';
        execute ]
]

{ #category : 'read/write' }
MsGsPortableUtil >> jsonStringFrom: valueOrAssocs [ 
	| dict rawJsonString param |
	((valueOrAssocs isArray or: [valueOrAssocs class = OrderedCollection])
		and: [valueOrAssocs notEmpty and: [valueOrAssocs first isKindOf: Association]])
		ifTrue: [dict := valueOrAssocs asDictionary.
			param := dict]
		ifFalse: [param := valueOrAssocs].
	rawJsonString := STON toJsonString: param.
	^ rawJsonString
]

{ #category : 'actions' }
MsGsPortableUtil >> queryParamsStringFrom: aDictionary [
	| strm params |
	aDictionary isEmpty ifTrue: [ ^ '' ].
	strm := '' writeStream.
	strm nextPutAll: '?'.
	params := aDictionary associations inject: Dictionary new into: [ :sum :each | sum at: each key put: each value asString. sum ].
	ZnResourceMetaUtils writeQueryFields: params on: strm.
	^ strm contents
]

{ #category : 'private' }
MsGsPortableUtil >> readJsonFrom: aStream [
	^ STON fromStream: aStream
]
