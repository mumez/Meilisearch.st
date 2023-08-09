accessing-faceting
sortFacetValuesBy: aDictionary
	| dict |
	dict := self faceting ifNil: [ Dictionary new ].
	dict at: 'sortFacetValuesBy' put: aDictionary asDictionary.
	self faceting: dict 