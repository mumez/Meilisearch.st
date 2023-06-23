actions
updatePrimaryKey: newPrimaryKey
	| opts |
	opts := { ('primaryKey' -> newPrimaryKey) } asDictionary.
	^ self update: opts