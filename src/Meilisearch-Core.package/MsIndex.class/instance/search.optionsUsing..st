searching
search: query optionsUsing: optionsBuilder
	^ self searchUsing: [ :opts |
		  opts q: query.
		  optionsBuilder value: opts ]