initialization
initFromDictionary: aDictionary
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
		ifPresent: [ :v |
		self enqueuedAt: (DateAndTime readFrom: v readStream) ].
	aDictionary
		at: 'startedAt'
		ifPresent: [ :v |
		self startedAt: (DateAndTime readFrom: v readStream) ].
	aDictionary
		at: 'finishedAt'
		ifPresent: [ :v |
		self finishedAt: (DateAndTime readFrom: v readStream) ].
