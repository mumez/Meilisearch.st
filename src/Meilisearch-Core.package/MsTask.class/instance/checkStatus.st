actions
checkStatus
	| resp |
	resp := self httpJsonGet: ''.
	self initFromDictionary: resp