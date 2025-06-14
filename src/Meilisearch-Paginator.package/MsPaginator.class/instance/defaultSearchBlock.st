defaults
defaultSearchBlock
	^ [ self searcher search: self query optionsUsing: self paginationOptionsBuilder ]