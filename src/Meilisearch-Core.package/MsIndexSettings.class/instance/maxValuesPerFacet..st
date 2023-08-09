accessing-faceting
maxValuesPerFacet: anInteger
	| dict |
	dict := self faceting ifNil: [ Dictionary new ].
	dict at: 'maxValuesPerFacet' put: anInteger.
	self faceting: dict