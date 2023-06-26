actions
multiSearchUsing: queriesBuilder
	| queries |
	queries := queriesBuilder value: MsSearchOptions.
	^ self multiSearch: queries