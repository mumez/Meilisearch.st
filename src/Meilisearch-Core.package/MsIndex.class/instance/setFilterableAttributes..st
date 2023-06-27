actions-index-settings
setFilterableAttributes: attributeNames
	^ self applySettingsUsing: [ :opts |
		  opts filterableAttributes: attributeNames ]