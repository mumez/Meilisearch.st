searching-hybrid
hybridSearch: query vector: vector embedder: embedderName semanticRatio: semanticRatio optionsUsing: optionsBuilder
	^ self searchUsing: [ :opts |
		  opts
			  q: query;
			  embedder: embedderName semanticRatio: semanticRatio.
		  vector ifNotNil: [ opts vector: vector ].
		  optionsBuilder ifNotNil: [ optionsBuilder value: opts ] ]