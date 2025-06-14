defaults
defaultPaginationOptionsBuilder
	^ [ :opts |
	  opts
		  hitsPerPage: self hitsPerPage;
		  page: self page ]