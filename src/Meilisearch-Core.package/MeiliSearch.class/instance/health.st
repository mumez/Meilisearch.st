actions
health
	| resp |
	resp := self httpJsonGet: 'health'.
	^ resp at: 'status' ifAbsent: [ 'unknown' ]