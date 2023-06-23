searching
search: query
	^ self searchUsing: [:opts | opts q: query]