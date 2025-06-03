index-settings
setSearchableAttributes: attributeNames
	^ self applySettingsUsing: [ :opts |
		  opts searchableAttributes: attributeNames ]