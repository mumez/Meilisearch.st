instance creation
apiKey: apiKey
	| inst |
	inst := self new.
	inst settings apiKey: apiKey.
	^ inst