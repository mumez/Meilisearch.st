Class {
	#name : 'MsResponse',
	#superclass : 'Object',
	#category : 'Meilisearch-Core',
	#package : 'Meilisearch-Core'
}

{ #category : 'instance creation' }
MsResponse class >> fromDictionary: aDictionary [
	| inst |
	inst := self new.
	inst initFromDictionary: aDictionary.
	^ inst
]

{ #category : 'initialization' }
MsResponse >> initFromDictionary: aDictionary [
	
]
