actions
createIndex: indexUid primaryKey: primaryKey
	^ self
		  createIndex: indexUid
		  options: { ('primaryKey' -> primaryKey) } asDictionary