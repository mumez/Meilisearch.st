searching
getPreviousPageOfResultsFrom: aMsSearchResponse

	^ self
		  search: aMsSearchResponse query
		  offset: aMsSearchResponse previousOffset
		  limit: aMsSearchResponse limit