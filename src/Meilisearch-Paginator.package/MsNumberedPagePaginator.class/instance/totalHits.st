accessing
totalHits
	^ self response ifNil: [ 0 ] ifNotNil: [ :resp | resp totalHits ]