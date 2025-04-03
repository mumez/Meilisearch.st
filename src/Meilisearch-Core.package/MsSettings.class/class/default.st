instance creation
default

	default ifNil: [ 
		default := self new.
		self setKey ].
	^ default