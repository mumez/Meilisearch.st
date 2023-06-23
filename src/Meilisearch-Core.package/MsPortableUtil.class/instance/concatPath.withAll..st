actions
concatPath: basePath withAll: pathComponents
	| strm components base |
	strm := (String new: 64) writeStream.
	components := pathComponents isString
		              ifTrue: [ Array with: pathComponents ]
		              ifFalse: [ pathComponents ].
	base := (basePath endsWith: '/')
		        ifTrue: [ basePath ]
		        ifFalse: [ basePath , '/' ].
	strm nextPutAll: base.
	components
		do: [ :each | strm nextPutAll: each ]
		separatedBy: [ strm nextPutAll: '/' ].
	^ strm contents