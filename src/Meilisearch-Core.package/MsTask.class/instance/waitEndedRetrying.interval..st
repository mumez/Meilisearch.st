actions
waitEndedRetrying: retryTimes interval: milliseconds
	| retriesRemaining |
	retriesRemaining := retryTimes.
	[ self checkStatus isEnded or: [ retriesRemaining <= 0 ] ]
		whileFalse: [
			(Delay forMilliseconds: milliseconds) wait.
			retriesRemaining := retriesRemaining - 1 ]