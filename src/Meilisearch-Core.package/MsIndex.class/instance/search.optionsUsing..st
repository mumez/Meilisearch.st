searching
search: query optionsUsing: optionsBuilder
	^ self searchWithOptions: [ :opts |
		  opts q: query.
		  optionsBuilder value: opts ]