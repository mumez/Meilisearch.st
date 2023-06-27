actions-index-settings
setTypoTolerance: aDictionary
	^ self applySettingsUsing: [ :opts |
		  opts typoTolerance: aDictionary ]