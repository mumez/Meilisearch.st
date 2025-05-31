searching
getNextPageOfResultsFrom: aMsSearchResponse 
	^self search: aMsSearchResponse query offset:aMsSearchResponse nextOffset limit: aMsSearchResponse limit