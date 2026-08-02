Class {
	#name : 'MsTasksReadOptions',
	#superclass : 'MsOptions',
	#instVars : [
		'limit',
		'from',
		'uids',
		'statuses',
		'types',
		'indexUids',
		'canceledBy',
		'beforeEnqueuedAt',
		'beforeStartedAt',
		'beforeFinishedAt',
		'afterEnqueuedAt',
		'afterStartedAt',
		'afterFinishedAt'
	],
	#category : 'Meilisearch-Core',
	#package : 'Meilisearch-Core'
}

{ #category : 'accessing' }
MsTasksReadOptions >> afterEnqueuedAt [

	^ afterEnqueuedAt
]

{ #category : 'accessing' }
MsTasksReadOptions >> afterEnqueuedAt: anObject [

	afterEnqueuedAt := anObject
]

{ #category : 'accessing' }
MsTasksReadOptions >> afterFinishedAt [

	^ afterFinishedAt
]

{ #category : 'accessing' }
MsTasksReadOptions >> afterFinishedAt: anObject [

	afterFinishedAt := anObject
]

{ #category : 'accessing' }
MsTasksReadOptions >> afterStartedAt [

	^ afterStartedAt
]

{ #category : 'accessing' }
MsTasksReadOptions >> afterStartedAt: anObject [

	afterStartedAt := anObject
]

{ #category : 'converting' }
MsTasksReadOptions >> asDictionary [
    | dict |
    dict := Dictionary new.
    self limit ifNotNil: [:v | dict at: 'limit' put: v].
    self from ifNotNil: [:v | dict at: 'from' put: v].
    self uids ifNotNil: [:v | dict at: 'uids' put: (self asCommaSepatatedString: v)].
    self statuses ifNotNil: [:v | dict at: 'statuses' put: (self asCommaSepatatedString: v)].
    self types ifNotNil: [:v | dict at: 'types' put: (self asCommaSepatatedString: v)].
    self indexUids ifNotNil: [:v | dict at: 'indexUids' put: (self asCommaSepatatedString: v)].
    self canceledBy ifNotNil: [:v | dict at: 'canceledBy' put: v].
    self beforeEnqueuedAt ifNotNil: [:v | dict at: 'beforeEnqueuedAt' put: v asString].
    self beforeStartedAt ifNotNil: [:v | dict at: 'beforeStartedAt' put: v asString].
    self beforeFinishedAt ifNotNil: [:v | dict at: 'beforeFinishedAt' put: v asString].
    self afterEnqueuedAt ifNotNil: [:v | dict at: 'afterEnqueuedAt' put: v asString].
    self afterStartedAt ifNotNil: [:v | dict at: 'afterStartedAt' put: v asString].
    self afterFinishedAt ifNotNil: [:v | dict at: 'afterFinishedAt' put: v asString].
    ^ dict

]

{ #category : 'accessing' }
MsTasksReadOptions >> beforeEnqueuedAt [

	^ beforeEnqueuedAt
]

{ #category : 'accessing' }
MsTasksReadOptions >> beforeEnqueuedAt: anObject [

	beforeEnqueuedAt := anObject
]

{ #category : 'accessing' }
MsTasksReadOptions >> beforeFinishedAt [

	^ beforeFinishedAt
]

{ #category : 'accessing' }
MsTasksReadOptions >> beforeFinishedAt: anObject [

	beforeFinishedAt := anObject
]

{ #category : 'accessing' }
MsTasksReadOptions >> beforeStartedAt [

	^ beforeStartedAt
]

{ #category : 'accessing' }
MsTasksReadOptions >> beforeStartedAt: anObject [

	beforeStartedAt := anObject
]

{ #category : 'adding status filters' }
MsTasksReadOptions >> canceled [
	self statuses add: 'canceled'
]

{ #category : 'accessing' }
MsTasksReadOptions >> canceledBy [

	^ canceledBy
]

{ #category : 'accessing' }
MsTasksReadOptions >> canceledBy: anObject [

	canceledBy := anObject
]

{ #category : 'adding status filters' }
MsTasksReadOptions >> enqueued [
	self statuses add: 'enqueued'
]

{ #category : 'adding status filters' }
MsTasksReadOptions >> failed [
	self statuses add: 'failed'
]

{ #category : 'accessing' }
MsTasksReadOptions >> from [

	^ from
]

{ #category : 'accessing' }
MsTasksReadOptions >> from: anObject [

	from := anObject
]

{ #category : 'accessing' }
MsTasksReadOptions >> indexUids [

	^ indexUids
]

{ #category : 'accessing' }
MsTasksReadOptions >> indexUids: anObject [

	indexUids := anObject
]

{ #category : 'accessing' }
MsTasksReadOptions >> limit [

	^ limit
]

{ #category : 'accessing' }
MsTasksReadOptions >> limit: anObject [

	limit := anObject
]

{ #category : 'adding status filters' }
MsTasksReadOptions >> processing [
	self statuses add: 'processing'
]

{ #category : 'accessing' }
MsTasksReadOptions >> statuses [

	^ statuses ifNil: [ statuses := Set new ]
]

{ #category : 'accessing' }
MsTasksReadOptions >> statuses: anObject [

	statuses := anObject
]

{ #category : 'adding status filters' }
MsTasksReadOptions >> succeeded [
	self statuses add: 'succeeded'
]

{ #category : 'accessing' }
MsTasksReadOptions >> types [

	^ types
]

{ #category : 'accessing' }
MsTasksReadOptions >> types: anObject [

	types := anObject
]

{ #category : 'accessing' }
MsTasksReadOptions >> uids [

	^ uids
]

{ #category : 'accessing' }
MsTasksReadOptions >> uids: anObject [

	uids := anObject
]
