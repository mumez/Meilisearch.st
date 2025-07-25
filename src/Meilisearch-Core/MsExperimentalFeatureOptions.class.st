Class {
	#name : 'MsExperimentalFeatureOptions',
	#superclass : 'MsOptions',
	#instVars : [
		'optionsDict'
	],
	#category : 'Meilisearch-Core',
	#package : 'Meilisearch-Core'
}

{ #category : 'converting' }
MsExperimentalFeatureOptions >> asDictionary [
	^ self optionsDict
]

{ #category : 'actions' }
MsExperimentalFeatureOptions >> at: optionKey enabled: enabledOrNot [
	self optionsDict at: optionKey put: enabledOrNot == true
]

{ #category : 'actions' }
MsExperimentalFeatureOptions >> disable: optionKey [
	self optionsDict at: optionKey put: false
]

{ #category : 'actions' }
MsExperimentalFeatureOptions >> enable: optionKey [
	self optionsDict at: optionKey put: true
]

{ #category : 'initialization' }
MsExperimentalFeatureOptions >> initFromDictionary: aDictionary [
	optionsDict := aDictionary asDictionary 
]

{ #category : 'actions' }
MsExperimentalFeatureOptions >> isEnabled: optionKey [
	^ self optionsDict at: optionKey ifAbsent: [ false ]
]

{ #category : 'accessing' }
MsExperimentalFeatureOptions >> optionKeys [
	^ self optionsDict keys sorted
]

{ #category : 'accessing' }
MsExperimentalFeatureOptions >> optionsDict [

	^ optionsDict ifNil: [ optionsDict := Dictionary new ]
]

{ #category : 'accessing' }
MsExperimentalFeatureOptions >> optionsDict: anObject [

	optionsDict := anObject
]

{ #category : 'actions' }
MsExperimentalFeatureOptions >> toggle: optionKey [
	self optionsDict at: optionKey put: (self optionsDict at: optionKey) negated
]
