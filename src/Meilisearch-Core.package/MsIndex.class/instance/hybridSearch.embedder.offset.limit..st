searching
hybridSearch: query embedder: embedderName offset: offset limit: limit
	^ self searchUsing: [ :opts |
		  opts
			  q: query;
			  embedder: embedderName;
			  offset: offset;
			  limit: limit ]