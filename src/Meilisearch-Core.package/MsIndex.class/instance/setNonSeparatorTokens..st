actions-index-settings
setNonSeparatorTokens: nonSeparatorTokens
	^ self applySettingsUsing: [ :opts |
		  opts nonSeparatorTokens: nonSeparatorTokens ]