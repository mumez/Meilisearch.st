actions
createIndex: indexUid options: indexOptions
	| conts |
	conts := { 'uid' -> indexUid } asDictionary.
	indexOptions keysAndValuesDo: [ :k :v |
		conts at: k put: v 
	].
	^ self asTask: (self httpJsonPost: 'indexes' contents: conts)