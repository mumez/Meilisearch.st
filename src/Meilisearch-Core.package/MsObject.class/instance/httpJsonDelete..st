requesting
httpJsonDelete: pathComponents
	| url |
	url := self buildUrl: pathComponents.
	^ self portableUtil httpJsonDelete: url on: self client