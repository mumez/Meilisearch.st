printing
printOn: aStream
	super printOn: aStream.
	aStream
		nextPutAll: ' results: ';
		print: results.
	aStream
		nextPutAll: ' offset: ';
		print: offset.
	aStream
		nextPutAll: ' limit: ';
		print: limit.
	aStream
		nextPutAll: ' total: ';
		print: total