printing
printOn: aStream
	super printOn: aStream.
	aStream
		nextPutAll: ' uid: ';
		print: uid.
	aStream
		nextPutAll: ' primaryKey: ';
		print: primaryKey.
	aStream
		nextPutAll: ' createdAt: ';
		print: createdAt.
	aStream
		nextPutAll: ' updatedAt: ';
		print: updatedAt