actions
update: options
	^ self asTask: (self httpJsonPatch: '' contents: options)