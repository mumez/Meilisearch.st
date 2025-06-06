searching-hybrid
vectorSearch: vector embedder: embedderName  optionsUsing: optionsBuilder
	^ self hybridSearch: nil vector: vector embedder: embedderName semanticRatio: 1 optionsUsing: optionsBuilder