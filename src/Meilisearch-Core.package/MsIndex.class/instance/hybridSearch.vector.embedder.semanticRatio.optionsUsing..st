searching-hybrid
hybridSearch: query vector: vector embedder: embedderName semanticRatio: semanticRatio optionsUsing: optionsBuilder
	^ self searchUsing: [ :opts |
		  opts
			  q: query;
			  vector: vector;
			  embedder: embedderName semanticRatio: semanticRatio.
		  optionsBuilder ifNotNil: [ optionsBuilder value: opts ] ]