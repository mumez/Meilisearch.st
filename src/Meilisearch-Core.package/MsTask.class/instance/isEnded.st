testing
isEnded
	^ self isSucceeded or: [ self isFailed or: [ self isCanceled ] ]