requesting
httpJsonPut: pathComponents contents: contents
	| url |
	url := self buildUrl: pathComponents.
	^ self portableUtil httpJsonPut: url contents: contents on: self client