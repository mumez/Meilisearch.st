defaults
defaultHybridSearchBlock
	^ [
	  self searcher
		  hybridSearch: self query
		  vector: self vector
		  embedder: self embedderName
		  semanticRatio: self semanticRatio
		  optionsUsing: self paginationOptionsBuilder ]