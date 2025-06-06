defaults
defaultVectorSearchBlock
	^ [
	  self searcher
		  vectorSearch: self vector
		  embedder: self embedderName
		  optionsUsing: self paginationOptionsBuilder ]