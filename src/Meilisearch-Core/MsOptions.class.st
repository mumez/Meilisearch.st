Class {
	#name : 'MsOptions',
	#superclass : 'Object',
	#category : 'Meilisearch-Core',
	#package : 'Meilisearch-Core'
}

{ #category : 'instance creation' }
MsOptions class >> fromDictionary: aDictionary [
	| inst |
	inst := self new.
	inst initFromDictionary: aDictionary.
	^ inst
]

{ #category : 'private' }
MsOptions >> asCommaSepatatedString: anArray [

	anArray ifNil: [ ^ '' ].
	^ ',' join: anArray
]

{ #category : 'converting' }
MsOptions >> asDictionary [
	^ Dictionary new
]

{ #category : 'initialization' }
MsOptions >> initFromDictionary: aDictionary [
	"override if you wish"
]
