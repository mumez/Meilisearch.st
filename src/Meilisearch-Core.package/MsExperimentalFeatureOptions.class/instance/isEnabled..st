actions
isEnabled: optionKey
	^ self optionsDict at: optionKey ifAbsent: [ false ]