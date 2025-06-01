index-settings
setMaxTotalHits: anInteger
	^ self applySettingsUsing: [ :opts |
		  opts pagination: { ('maxTotalHits' -> anInteger) } asDictionary ]