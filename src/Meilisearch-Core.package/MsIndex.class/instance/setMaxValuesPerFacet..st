index-settings
setMaxValuesPerFacet: anInteger
	^ self applySettingsUsing: [ :opts |
		  opts faceting: { ('maxValuesPerFacet' -> anInteger) } asDictionary ]