actions
indexesWithOptions: options
	| resp |
	resp := self httpJsonGet: 'indexes' params: options.
	resp at: 'results' ifPresent: [ :results |
		| indexes |
		indexes := results collect: [ :each | MsIndex settings: self settings values: each].
		resp at: 'results' put: indexes ].
	^ resp