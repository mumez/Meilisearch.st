actions
tasksWithOptions: options
	| resp |
	resp := self httpJsonGet: 'tasks' params: options.
	resp at: 'results' ifPresent: [ :results |
		| indexes |
		indexes := results collect: [ :each | MsTask settings: self settings values: each].
		resp at: 'results' put: indexes ].
	^ resp