initialization
initFromDictionary: aDictionary
	aDictionary at: 'hits' ifPresent: [ :v | self hits: v ].
	aDictionary at: 'offset' ifPresent: [ :v | self offset: v asInteger ].
	aDictionary at: 'limit' ifPresent: [ :v | self limit: v asInteger ].
	aDictionary at: 'estimatedTotalHits' ifPresent: [ :v | self estimatedTotalHits: v asInteger ].
	aDictionary at: 'totalHits' ifPresent: [ :v | self totalHits: v asInteger ].
	aDictionary at: 'totalPages' ifPresent: [ :v | self totalPages: v asInteger ].
	aDictionary at: 'hitsPerPage' ifPresent: [ :v | self hitsPerPage: v asInteger ].
	aDictionary at: 'page' ifPresent: [ :v | self page: v asInteger ].
	aDictionary at: 'facetDistribution' ifPresent: [ :v | self facetDistribution: v ].
	aDictionary at: 'facetStats' ifPresent: [ :v | self facetStats: v ].
	aDictionary at: 'processingTimeMs' ifPresent: [ :v | self processingTimeMs: v asInteger ].
	aDictionary at: 'query' ifPresent: [ :v | self query: v ].
