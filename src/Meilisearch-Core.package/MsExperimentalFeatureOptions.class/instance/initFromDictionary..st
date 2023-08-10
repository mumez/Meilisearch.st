initialization
initFromDictionary: aDictionary
	aDictionary at: 'vectorStore' ifPresent: [ :v | self vectorStore: v ].
	aDictionary
		at: 'scoreDetails'
		ifPresent: [ :v | self scoreDetails: v ]