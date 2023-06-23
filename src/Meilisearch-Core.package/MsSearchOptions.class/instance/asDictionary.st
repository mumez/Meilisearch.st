converting
asDictionary
	| dict |
	dict := Dictionary new.
	self q ifNotNil: [:v | dict at: 'q' put: v].
	self offset ifNotNil: [:v | dict at: 'offset' put: v].
	self limit ifNotNil: [:v | dict at: 'limit' put: v].
	self filter ifNotNil: [:v | dict at: 'filter' put: v].
	self facetsDistribution ifNotNil: [:v | dict at: 'facetsDistribution' put: v].
	self facetsToRetrieve ifNotNil: [:v | dict at: 'facetsToRetrieve' put: v].
	self attributesToRetrieve ifNotNil: [:v | dict at: 'attributesToRetrieve' put: v].
	self attributesToCrop ifNotNil: [:v | dict at: 'attributesToCrop' put: v].
	self cropLength ifNotNil: [:v | dict at: 'cropLength' put: v].
	self attributesToHighlight ifNotNil: [:v | dict at: 'attributesToHighlight' put: v].
	self matches ifNotNil: [:v | dict at: 'matches' put: v].
	self filterBy ifNotNil: [:v | dict at: 'filterBy' put: v].
	^ dict
