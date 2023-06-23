converting
asDictionary
	| dict |
	dict := Dictionary new.
	self primaryKey ifNotNil: [:v | dict at: 'primaryKey' put: v].
	self csvDelimiter ifNotNil: [:v | dict at: 'csvDelimiter' put: v].
	^ dict