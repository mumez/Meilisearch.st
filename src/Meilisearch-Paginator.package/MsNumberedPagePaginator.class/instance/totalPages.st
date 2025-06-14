accessing
totalPages
	^ self response ifNil: [ 0 ] ifNotNil: [ :resp | resp totalPages ]