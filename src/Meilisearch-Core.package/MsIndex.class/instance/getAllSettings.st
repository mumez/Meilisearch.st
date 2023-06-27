actions-index-settings
getAllSettings
	| resp |
	resp := self httpJsonGet: 'settings'.
	^ MsIndexSettings fromDictionary: resp