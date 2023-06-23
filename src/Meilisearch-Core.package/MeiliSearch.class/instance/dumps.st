actions
dumps
	^ self asTask: (self httpJsonPost: 'dumps' contents: '')