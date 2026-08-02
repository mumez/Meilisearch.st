Class {
	#name : 'MsSettings',
	#superclass : 'Object',
	#instVars : [
		'settingsDict'
	],
	#classInstVars : [
		'default'
	],
	#category : 'Meilisearch-Core',
	#package : 'Meilisearch-Core'
}

{ #category : 'instance creation' }
MsSettings class >> default [
	^default ifNil: [ default := self new ]
]

{ #category : 'instance creation' }
MsSettings class >> fromDefault [
	^ self inheritFrom: self default
]

{ #category : 'instance creation' }
MsSettings class >> inheritFrom: aSettings [
	| inst |
	inst := self new.
	aSettings settingsDict keysAndValuesDo: [ :k :v | inst at: k put: v ].
	^ inst
]

{ #category : 'class initialization' }
MsSettings class >> initialize [
	default := nil
]

{ #category : 'accessing' }
MsSettings >> apiKey [
	^self at: #apiKey ifAbsentPut: ['']
]

{ #category : 'accessing' }
MsSettings >> apiKey: apiKey [
	self at: #apiKey put: apiKey
]

{ #category : 'actions-dictionary' }
MsSettings >> at: key [
	^self settingsDict at: key
]

{ #category : 'actions-dictionary' }
MsSettings >> at: key ifAbsent: aBlock [
	^self settingsDict at: key ifAbsent: aBlock
]

{ #category : 'actions-dictionary' }
MsSettings >> at: key ifAbsentPut: aBlock [
	^self settingsDict at: key ifAbsentPut: aBlock
]

{ #category : 'actions-dictionary' }
MsSettings >> at: key put: value [
	^self settingsDict at: key put: value
]

{ #category : 'defaults' }
MsSettings >> defaultTargetUrl [
	^'http://127.0.0.1:7700'
]

{ #category : 'initialize-release' }
MsSettings >> initialize [
	settingsDict := nil
]

{ #category : 'accessing-private' }
MsSettings >> settingsDict [
	^ settingsDict ifNil: [settingsDict := IdentityDictionary new]
]

{ #category : 'accessing-private' }
MsSettings >> settingsDict: anObject [
	settingsDict := anObject
]

{ #category : 'accessing' }
MsSettings >> targetUrl [
	^self at: #targetUrl ifAbsentPut: [self defaultTargetUrl]
]

{ #category : 'accessing' }
MsSettings >> targetUrl: targetUrl [
	self at: #targetUrl put: targetUrl
]

{ #category : 'accessing' }
MsSettings >> taskCheckInterval [
	^self at: #taskCheckInterval ifAbsentPut: [100]
]

{ #category : 'accessing' }
MsSettings >> taskCheckInterval: msecs [
	self at: #taskCheckInterval put: msecs
]

{ #category : 'accessing' }
MsSettings >> taskRetryTimes [
	^self at: #taskRetryTimes ifAbsentPut: [20]
]

{ #category : 'accessing' }
MsSettings >> taskRetryTimes: apiKey [
	self at: #taskRetryTimes put: apiKey
]
