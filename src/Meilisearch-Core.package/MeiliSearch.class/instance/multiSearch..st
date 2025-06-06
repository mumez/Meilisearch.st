searching
multiSearch: queries
	| conts resp |
	conts := Dictionary new.
	conts at: 'queries' put: (queries asArray collect: [:each | each asDictionary]).
	resp := self httpJsonPost: {'multi-search'} contents: conts.
	^ resp at: 'results' ifPresent: [ :col | col collect: [ :each | MsSearchResponse fromDictionary: each ] ]