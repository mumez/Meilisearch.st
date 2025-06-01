searching
hybridSearch: query embedder: embedderName
	^ self searchUsing: [ :opts |
		  opts
			  q: query;
			  embedder: embedderName]