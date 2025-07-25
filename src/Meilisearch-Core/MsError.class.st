Class {
	#name : 'MsError',
	#superclass : 'Error',
	#instVars : [
		'properties',
		'response',
		'kind'
	],
	#category : 'Meilisearch-Core',
	#package : 'Meilisearch-Core'
}

{ #category : 'instance creation' }
MsError class >> fromResponse: response [
	| code |
	code := response code.
	code = 204 ifTrue: [^ (self response: response kind: #NoContent) ].
	code = 401
		ifTrue: [^ (self response: response kind: #Unauthorized) ].
	code = 403
		ifTrue: [^ (self response: response kind: #Forbidden) ].
	code = 404
		ifTrue: [^ (self response: response kind: #NotFound) ].
	code = 409 ifTrue: [^ (self response: response kind: #CannotDelete) ].
	^ (self response: response kind: #Generic) signal
]

{ #category : 'instance creation' }
MsError class >> response: response kind: kind [
	^self new response: response; kind: kind; yourself
]

{ #category : 'accessing' }
MsError >> kind [

	^ kind
]

{ #category : 'accessing' }
MsError >> kind: anObject [

	kind := anObject
]

{ #category : 'accessing' }
MsError >> messageText [
	^ messageText ifNil: [self kind asString]
]

{ #category : 'accessing' }
MsError >> properties [
	"Answer the value of properties"

	^ properties ifNil: [ properties := Dictionary new ]
]

{ #category : 'accessing' }
MsError >> properties: anObject [
	"Set the value of properties"

	properties := anObject
]

{ #category : 'accessing' }
MsError >> response [
	"Answer the value of response"

	^ response
]

{ #category : 'accessing' }
MsError >> response: anObject [
	"Set the value of response"

	response := anObject
]
