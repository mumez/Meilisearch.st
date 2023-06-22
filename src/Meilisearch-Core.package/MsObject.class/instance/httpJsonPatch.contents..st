requesting
httpJsonPatch: pathComponents contents: contents
	| url |
	url := self buildUrl: pathComponents.
	^ self portableUtil httpJsonPatch: url contents: contents on: self client