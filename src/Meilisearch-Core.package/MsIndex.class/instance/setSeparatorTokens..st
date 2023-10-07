actions-index-settings
setSeparatorTokens: separatorTokens
	^ self applySettingsUsing: [ :opts |
		  opts separatorTokens: separatorTokens ]