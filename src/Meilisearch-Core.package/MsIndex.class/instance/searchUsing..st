searching-basic
searchUsing: optionsBuilder
	| opts |
	opts := MsSearchOptions new.
	self defaultSearchOptionsBuilder value: opts.
	optionsBuilder value: opts.
	^ self searchWithOptions: opts asDictionary