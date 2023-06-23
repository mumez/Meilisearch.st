actions
indexesOffset: offset limit: limit
	| opts |
	opts := {'offset'->offset. 'limit'->limit  } asDictionary.
	^ self indexesWithOptions: opts