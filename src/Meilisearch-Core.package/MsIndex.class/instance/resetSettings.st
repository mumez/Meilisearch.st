actions-index-settings
resetSettings
	^ self asTask: (self httpJsonDelete: 'settings')