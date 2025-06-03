index-settings
setDistinctAttribute: distinctAttribute
	^ self applySettingsUsing: [ :opts |
		  opts distinctAttribute: distinctAttribute ]