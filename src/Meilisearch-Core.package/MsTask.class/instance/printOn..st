printing
printOn: aStream
	super printOn: aStream.
	aStream
		nextPutAll: ' uid: ';
		print: uid.
	aStream
		nextPutAll: ' indexUid: ';
		print: indexUid.
	aStream
		nextPutAll: ' status: ';
		print: status.
	aStream
		nextPutAll: ' type: ';
		print: type.
	aStream
		nextPutAll: ' canceledBy: ';
		print: canceledBy.
	aStream
		nextPutAll: ' details: ';
		print: details.
	aStream
		nextPutAll: ' error: ';
		print: error.
	aStream
		nextPutAll: ' duration: ';
		print: duration.
	aStream
		nextPutAll: ' enqueuedAt: ';
		print: enqueuedAt.
	aStream
		nextPutAll: ' startedAt: ';
		print: startedAt.
	aStream
		nextPutAll: ' finishedAt: ';
		print: finishedAt