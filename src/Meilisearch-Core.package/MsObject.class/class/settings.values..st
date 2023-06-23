instance creation
settings: msSettings values: aDictionary

	^ (self settings: msSettings)
		  initFromDictionary: aDictionary;
		  yourself