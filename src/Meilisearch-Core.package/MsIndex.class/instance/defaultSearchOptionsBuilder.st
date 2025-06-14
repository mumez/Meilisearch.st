accessing
defaultSearchOptionsBuilder
	^ defaultSearchOptionsBuilder ifNil: [
		  defaultSearchOptionsBuilder := [ :opts | opts ] ]