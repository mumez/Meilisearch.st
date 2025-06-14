defaults
defaultVectorSearchBlock
	^ [
	  self searcher
		  vectorSearch: self vector
		  embedder: self embedder
		  optionsUsing: self paginationOptionsBuilder ]