actions
queryParamsStringFrom: aDictionary
	| strm params |
	aDictionary isEmpty ifTrue: [ ^ '' ].
	strm := '' writeStream.
	strm nextPutAll: '?'.
	params := aDictionary associations inject: Dictionary new into: [ :sum :each | sum at: each key put: each value asString. sum ].
	ZnResourceMetaUtils writeQueryFields: params on: strm.
	^ strm contents