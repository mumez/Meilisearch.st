actions-index-settings
setDisplayedAttributes: attributeNames
	^ self applySettingsUsing: [ :opts |
		  opts displayedAttributes: attributeNames ]