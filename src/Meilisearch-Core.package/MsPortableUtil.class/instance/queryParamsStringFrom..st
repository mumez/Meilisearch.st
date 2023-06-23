actions
queryParamsStringFrom: aDictionary
	| strm |
	aDictionary isEmpty ifTrue: [ ^ '' ].
	strm := '' writeStream.
	strm nextPutAll: '?'.
	aDictionary associations
		do: [ :assoc |
			strm nextPutAll: assoc key asString.
			strm nextPutAll: '='.
			strm nextPutAll: assoc value asString ]
		separatedBy: [ strm nextPutAll: '&' ].
	^ strm contents