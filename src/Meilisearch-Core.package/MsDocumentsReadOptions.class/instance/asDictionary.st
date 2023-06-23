converting
asDictionary
	| dict |
	dict := Dictionary new.
	self offset ifNotNil: [:v | dict at: 'offset' put: v].
	self limit ifNotNil: [:v | dict at: 'limit' put: v].
	self fields ifNotNil: [:v | dict at: 'fields' put: v].
	self filter ifNotNil: [:v | dict at: 'filter' put: v].
	^ dict
