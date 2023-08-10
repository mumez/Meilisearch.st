initialization
initFromDictionary: aDictionary
    aDictionary at: 'facetHits' ifPresent: [ :v | self facetHits: v ].
    aDictionary at: 'facetQuery' ifPresent: [ :v | self facetQuery: v ].
    aDictionary at: 'processingTimeMs' ifPresent: [ :v | self processingTimeMs: v ].
