actions-index-settings
setSortableAttributes: attributeNames
	^ self applySettingsUsing: [ :opts |
		  opts sortableAttributes: attributeNames ]