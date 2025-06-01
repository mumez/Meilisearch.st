index-settings
setStopWords: stopWords
	^ self applySettingsUsing: [ :opts |
		  opts stopWords: stopWords ]