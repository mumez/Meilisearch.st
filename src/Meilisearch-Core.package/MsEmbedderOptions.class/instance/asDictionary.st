converting
asDictionary
	| dict |
	dict := Dictionary new.
	self source ifNotNil: [:v | dict at: 'source' put: v].
	self url ifNotNil: [:v | dict at: 'url' put: v].
	self apiKey ifNotNil: [:v | dict at: 'apiKey' put: v].
	self model ifNotNil: [:v | dict at: 'model' put: v].
	self documentTemplate ifNotNil: [:v | dict at: 'documentTemplate' put: v].
	self documentTemplateMaxBytes ifNotNil: [:v | dict at: 'documentTemplateMaxBytes' put: v].
	self dimensions ifNotNil: [:v | dict at: 'dimensions' put: v].
	self revision ifNotNil: [:v | dict at: 'revision' put: v].
	self distribution ifNotNil: [:v | dict at: 'distribution' put: v].
	self request ifNotNil: [:v | dict at: 'request' put: v].
	self response ifNotNil: [:v | dict at: 'response' put: v].
	self binaryQuantized ifNotNil: [:v | dict at: 'binaryQuantized' put: v].
	self indexingEmbedder ifNotNil: [:v | dict at: 'indexingEmbedder' put: v].
	self searchEmbedder ifNotNil: [:v | dict at: 'searchEmbedder' put: v].
	self pooling ifNotNil: [:v | dict at: 'pooling' put: v].
	^ dict