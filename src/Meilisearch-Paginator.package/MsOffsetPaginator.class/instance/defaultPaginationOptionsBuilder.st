defaults
defaultPaginationOptionsBuilder
	^ [ :opts |
	  opts
		  limit: self limit;
		  offset: self offset ]