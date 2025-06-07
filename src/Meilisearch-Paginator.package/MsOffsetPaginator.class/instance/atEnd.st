testing
atEnd
	self response ifNil: [ self fire ].
	^ self offset > 0 and: [ self hitsCount = 0 ]