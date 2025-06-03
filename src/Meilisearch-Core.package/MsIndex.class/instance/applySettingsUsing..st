index-settings
applySettingsUsing: optionsBuilder
	| options |
	options := MsIndexSettings new.
	optionsBuilder value: options.
	^ self applySettings: options asDictionary.