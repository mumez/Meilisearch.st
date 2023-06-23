actions
indexes
	| resp |
	resp := self httpJsonGet: 'indexes'.
	resp at: 'results' ifPresent: [ :results |
		| indexes |
		indexes := results collect: [ :each | MsIndex settings: self settings values: each].
		resp at: 'results' put: indexes ].
	^ resp