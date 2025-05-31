initialization
initFromDictionary: aDictionary
	aDictionary at: 'limit' ifPresent: [ :v | self limit: v asInteger ].
	aDictionary at: 'total' ifPresent: [ :v | self total: v asInteger ].
	aDictionary at: 'results' ifPresent: [ :v | self results: v ].
	aDictionary at: 'offset' ifPresent: [ :v | self offset: v asInteger ].
