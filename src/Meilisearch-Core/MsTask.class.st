Class {
	#name : 'MsTask',
	#superclass : 'MsObject',
	#instVars : [
		'uid',
		'indexUid',
		'status',
		'type',
		'canceledBy',
		'details',
		'error',
		'duration',
		'enqueuedAt',
		'startedAt',
		'finishedAt'
	],
	#category : 'Meilisearch-Core',
	#package : 'Meilisearch-Core'
}

{ #category : 'building' }
MsTask >> buildBaseUrl [
	^ self portableUtil concatPath: super buildBaseUrl withAll: (Array with: 'tasks' with: self uid asString).
]

{ #category : 'accessing' }
MsTask >> canceledBy [

	^ canceledBy
]

{ #category : 'accessing' }
MsTask >> canceledBy: anObject [

	canceledBy := anObject
]

{ #category : 'actions' }
MsTask >> checkStatus [
	| resp |
	resp := self httpJsonGet: ''.
	self initFromDictionary: resp
]

{ #category : 'accessing' }
MsTask >> details [

	^ details
]

{ #category : 'accessing' }
MsTask >> details: anObject [

	details := anObject
]

{ #category : 'accessing' }
MsTask >> duration [

	^ duration
]

{ #category : 'accessing' }
MsTask >> duration: anObject [

	duration := anObject
]

{ #category : 'accessing' }
MsTask >> enqueuedAt [

	^ enqueuedAt
]

{ #category : 'accessing' }
MsTask >> enqueuedAt: anObject [

	enqueuedAt := anObject
]

{ #category : 'accessing' }
MsTask >> error [

	^ error
]

{ #category : 'accessing' }
MsTask >> error: anObject [

	error := anObject
]

{ #category : 'accessing' }
MsTask >> finishedAt [

	^ finishedAt
]

{ #category : 'accessing' }
MsTask >> finishedAt: anObject [

	finishedAt := anObject
]

{ #category : 'accessing' }
MsTask >> indexUid [

	^ indexUid
]

{ #category : 'accessing' }
MsTask >> indexUid: anObject [

	indexUid := anObject
]

{ #category : 'initialization' }
MsTask >> initFromDictionary: aDictionary [
	aDictionary at: 'uid' ifPresent: [ :v | self uid: v ].
	aDictionary at: 'taskUid' ifPresent: [ :v | self uid: v ].
	aDictionary at: 'indexUid' ifPresent: [ :v | self indexUid: v ].
	aDictionary at: 'status' ifPresent: [ :v | self status: v ].
	aDictionary at: 'type' ifPresent: [ :v | self type: v ].
	aDictionary at: 'canceledBy' ifPresent: [ :v | self canceledBy: v ].
	aDictionary at: 'details' ifPresent: [ :v | self details: v ].
	aDictionary at: 'error' ifPresent: [ :v | self error: v ].
	aDictionary at: 'duration' ifPresent: [ :v | self duration: v ].

	aDictionary
		at: 'enqueuedAt'
		ifPresent: [ :v | v ifNotNil: [  
		self enqueuedAt: (DateAndTime readFrom: v readStream)] ].
	aDictionary
		at: 'startedAt'
		ifPresent: [ :v | v ifNotNil: [ 
		self startedAt: (DateAndTime readFrom: v readStream)] ].
	aDictionary
		at: 'finishedAt'
		ifPresent: [ :v | v ifNotNil: [ 
		self finishedAt: (DateAndTime readFrom: v readStream)] ].

]

{ #category : 'testing' }
MsTask >> isCanceled [
	^ self status = 'canceled'
	
]

{ #category : 'testing' }
MsTask >> isEnded [
	^ self isSucceeded or: [ self isFailed or: [ self isCanceled ] ]
]

{ #category : 'testing' }
MsTask >> isEnqueued [
	^ self status = 'enqueued'
	
]

{ #category : 'testing' }
MsTask >> isFailed [
	^ self status = 'failed'
	
]

{ #category : 'testing' }
MsTask >> isProcessing [
	^ self status = 'processing'
	
]

{ #category : 'testing' }
MsTask >> isSucceeded [
	^ self status = 'succeeded'
	
]

{ #category : 'printing' }
MsTask >> printOn: aStream [
	super printOn: aStream.
	aStream
		nextPutAll: ' uid: ';
		print: uid.
	aStream
		nextPutAll: ' indexUid: ';
		print: indexUid.
	aStream
		nextPutAll: ' status: ';
		print: status.
	aStream
		nextPutAll: ' type: ';
		print: type.
	aStream
		nextPutAll: ' canceledBy: ';
		print: canceledBy.
	aStream
		nextPutAll: ' details: ';
		print: details.
	aStream
		nextPutAll: ' error: ';
		print: error.
	aStream
		nextPutAll: ' duration: ';
		print: duration.
	aStream
		nextPutAll: ' enqueuedAt: ';
		print: enqueuedAt.
	aStream
		nextPutAll: ' startedAt: ';
		print: startedAt.
	aStream
		nextPutAll: ' finishedAt: ';
		print: finishedAt
]

{ #category : 'accessing' }
MsTask >> startedAt [

	^ startedAt
]

{ #category : 'accessing' }
MsTask >> startedAt: anObject [

	startedAt := anObject
]

{ #category : 'accessing' }
MsTask >> status [

	^ status
]

{ #category : 'accessing' }
MsTask >> status: anObject [

	status := anObject
]

{ #category : 'accessing' }
MsTask >> type [

	^ type
]

{ #category : 'accessing' }
MsTask >> type: anObject [

	type := anObject
]

{ #category : 'accessing' }
MsTask >> uid [

	^ uid
]

{ #category : 'accessing' }
MsTask >> uid: anObject [

	uid := anObject
]

{ #category : 'actions' }
MsTask >> waitEndedForAWhile [
	^ self waitEndedRetrying: self settings taskRetryTimes interval: self settings taskCheckInterval
]

{ #category : 'actions' }
MsTask >> waitEndedRetrying: retryTimes interval: milliseconds [
	| retriesRemaining |
	retriesRemaining := retryTimes.
	[ self checkStatus isEnded or: [ retriesRemaining <= 0 ] ]
		whileFalse: [
			(Delay forMilliseconds: milliseconds) wait.
			retriesRemaining := retriesRemaining - 1 ]
]
