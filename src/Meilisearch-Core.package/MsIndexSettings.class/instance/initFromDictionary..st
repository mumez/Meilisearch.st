initialization
initFromDictionary: aDictionary
    aDictionary at: 'displayedAttributes' ifPresent: [ :v | self displayedAttributes: v ].
    aDictionary at: 'distinctAttribute' ifPresent: [ :v | self distinctAttribute: v ].
    aDictionary at: 'faceting' ifPresent: [ :v | self faceting: v ].
    aDictionary at: 'filterableAttributes' ifPresent: [ :v | self filterableAttributes: v ].
    aDictionary at: 'pagination' ifPresent: [ :v | self pagination: v ].
    aDictionary at: 'rankingRules' ifPresent: [ :v | self rankingRules: v ].
    aDictionary at: 'searchableAttributes' ifPresent: [ :v | self searchableAttributes: v ].
    aDictionary at: 'sortableAttributes' ifPresent: [ :v | self sortableAttributes: v ].
    aDictionary at: 'stopWords' ifPresent: [ :v | self stopWords: v ].
    aDictionary at: 'synonyms' ifPresent: [ :v | self synonyms: v ].
    aDictionary at: 'typoTolerance' ifPresent: [ :v | self typoTolerance: v ].
