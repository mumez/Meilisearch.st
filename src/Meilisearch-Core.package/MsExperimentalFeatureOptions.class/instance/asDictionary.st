converting
asDictionary
	| dict |
	dict := Dictionary new.
	self vectorStore ifNotNil: [ :v | dict at: 'vectorStore' put: v ].
	self scoreDetails ifNotNil: [ :v | dict at: 'scoreDetails' put: v ].
	^ dict