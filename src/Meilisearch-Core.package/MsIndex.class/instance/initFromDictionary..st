initialization
initFromDictionary: aDictionary
	aDictionary at: 'uid' ifPresent: [ :v | self uid: v ].
	aDictionary at: 'primaryKey' ifPresent: [ :v | self primaryKey: v ].
	aDictionary
		at: 'createdAt'
		ifPresent: [ :v | v ifNotNil: [  
		self createdAt: (DateAndTime readFrom: v readStream)] ].
	aDictionary
		at: 'updatedAt'
		ifPresent: [ :v | v ifNotNil: [  
		self updatedAt: (DateAndTime readFrom: v readStream)] ].