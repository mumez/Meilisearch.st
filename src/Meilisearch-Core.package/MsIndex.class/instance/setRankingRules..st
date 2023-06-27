actions-index-settings
setRankingRules: rankingRules
	^ self applySettingsUsing: [ :opts |
		  opts rankingRules: rankingRules ]