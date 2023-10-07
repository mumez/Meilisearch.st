actions-index-settings
setDictionary: keys
	^ self applySettingsUsing: [ :opts |
		  opts dictionary: keys ]