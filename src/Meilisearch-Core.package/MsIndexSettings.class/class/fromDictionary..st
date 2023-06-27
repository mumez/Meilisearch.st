instance creation
fromDictionary: aDictionary
	| inst |
	inst := self new.
	inst initFromDictionary: aDictionary.
	^ inst