searching
searchWithOptions: options
	| resp |
	resp := self httpJsonPost: 'search' contents: options.
	^ MsSearchResponse fromDictionary: resp