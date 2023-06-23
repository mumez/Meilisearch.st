searching
search: query offset: offset limit: limit
	^ self searchUsing: [ :opts |
		  opts
			  q: query;
			  offset: offset;
			  limit: limit ]