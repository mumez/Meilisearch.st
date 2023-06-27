actions-index-settings
applySettings: options
	^ self asTask: (self httpJsonPatch: 'settings' contents: options)