defaults
defaultHybridSearchBlock
	^ [
	  self searcher
		  hybridSearch: self query
		  vector: self vector
		  embedder: self embedder
		  semanticRatio: self semanticRatio
		  optionsUsing: self paginationOptionsBuilder ]