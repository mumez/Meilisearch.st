actions
swapIndexes: swappingIndexPairs
	| conts |
	conts := Dictionary new.
	conts at: 'indexes' put: swappingIndexPairs.
	^ self httpJsonPost: {'indexes'. 'swap'} contents: conts