searching
vectorSearch: vector offset: offset limit: limit
	^ self searchUsing: [ :opts |
		  opts
			  vector: vector;
			  offset: offset;
			  limit: limit ]