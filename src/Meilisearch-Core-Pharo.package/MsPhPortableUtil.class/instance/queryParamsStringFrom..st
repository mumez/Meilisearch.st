actions
queryParamsStringFrom: aDictionary
	| strm |
	aDictionary isEmpty ifTrue: [ ^ '' ].
	strm := '' writeStream.
	strm nextPutAll: '?'.
	ZnResourceMetaUtils writeQueryFields: aDictionary on: strm.
	^ strm contents