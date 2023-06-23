searching
searchUsing: optionsBuilder
	| opts |
	opts := MsSearchOptions new.
	optionsBuilder value: opts.
	^ self searchWithOptions: opts