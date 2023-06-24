actions
keys
	| resp |
	resp := self httpJsonGet: 'keys'.
	^ MsRangedResponse fromDictionary: resp