converting
asDictionary
    | dict |
    dict := Dictionary new.
    self dictionary ifNotNil: [:v | dict at: 'dictionary' put: v].
    self displayedAttributes ifNotNil: [:v | dict at: 'displayedAttributes' put: v].
    self distinctAttribute ifNotNil: [:v | dict at: 'distinctAttribute' put: v].
    self embedders ifNotNil: [:v | dict at: 'embedders' put: v].
    self faceting ifNotNil: [:v | dict at: 'faceting' put: v].
    self facetSearch ifNotNil: [:v | dict at: 'facetSearch' put: v].
    self filterableAttributes ifNotNil: [:v | dict at: 'filterableAttributes' put: v].
    self pagination ifNotNil: [:v | dict at: 'pagination' put: v].
    self rankingRules ifNotNil: [:v | dict at: 'rankingRules' put: v].
    self searchableAttributes ifNotNil: [:v | dict at: 'searchableAttributes' put: v].
    self separatorTokens ifNotNil: [:v | dict at: 'separatorTokens' put: v].
    self nonSeparatorTokens ifNotNil: [:v | dict at: 'nonSeparatorTokens' put: v].
    self sortableAttributes ifNotNil: [:v | dict at: 'sortableAttributes' put: v].
    self stopWords ifNotNil: [:v | dict at: 'stopWords' put: v].
    self synonyms ifNotNil: [:v | dict at: 'synonyms' put: v].
    self typoTolerance ifNotNil: [:v | dict at: 'typoTolerance' put: v].
    ^ dict
