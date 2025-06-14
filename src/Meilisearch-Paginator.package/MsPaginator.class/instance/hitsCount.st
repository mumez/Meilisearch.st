accessing
hitsCount
	^ self response ifNil: [ 0 ] ifNotNil: [ :resp | resp hits size ]