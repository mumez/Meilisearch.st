initialization
initFromDictionary: aDictionary
	aDictionary at: 'hits' ifPresent: [ :v | self hits: v ].
	aDictionary at: 'offset' ifPresent: [ :v | self offset: v ].
	aDictionary at: 'limit' ifPresent: [ :v | self limit: v ].
	aDictionary at: 'nbHits' ifPresent: [ :v | self nbHits: v ].
	aDictionary at: 'exhaustiveNbHits' ifPresent: [ :v | self exhaustiveNbHits: v ].
	aDictionary at: 'facetsDistribution' ifPresent: [ :v | self facetsDistribution: v ].
	aDictionary at: 'exhaustiveFacetsCount' ifPresent: [ :v | self exhaustiveFacetsCount: v ].
	aDictionary at: 'processingTimeMs' ifPresent: [ :v | self processingTimeMs: v ].
	aDictionary at: 'query' ifPresent: [ :v | self query: v ].
