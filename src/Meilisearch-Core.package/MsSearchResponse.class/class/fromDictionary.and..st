instance creation
fromDictionary: aDictionary and: index
	| inst |
	inst := self new.
	inst index:index.
	inst initFromDictionary: aDictionary.
	^ inst