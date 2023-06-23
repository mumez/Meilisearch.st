initialization
initFromDictionary: aDictionary
	aDictionary at: 'hits' ifPresent: [ :v | self hits: v ].
	aDictionary at: 'offset' ifPresent: [ :v | self offset: v ].
	aDictionary at: 'limit' ifPresent: [ :v | self limit: v ].
	aDictionary at: 'estimatedTotalHits' ifPresent: [ :v | self estimatedTotalHits: v ].
	aDictionary at: 'totalHits' ifPresent: [ :v | self totalHits: v ].
	aDictionary at: 'totalPages' ifPresent: [ :v | self totalPages: v ].
	aDictionary at: 'hitsPerPage' ifPresent: [ :v | self hitsPerPage: v ].
	aDictionary at: 'page' ifPresent: [ :v | self page: v ].
	aDictionary at: 'facetDistribution' ifPresent: [ :v | self facetDistribution: v ].
	aDictionary at: 'facetStats' ifPresent: [ :v | self facetStats: v ].
	aDictionary at: 'processingTimeMs' ifPresent: [ :v | self processingTimeMs: v ].
	aDictionary at: 'query' ifPresent: [ :v | self query: v ].
