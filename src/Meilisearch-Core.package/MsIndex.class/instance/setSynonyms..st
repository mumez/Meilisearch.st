actions-index-settings
setSynonyms: aDictionary
	^ self applySettingsUsing: [ :opts |
		  opts synonyms: aDictionary ]