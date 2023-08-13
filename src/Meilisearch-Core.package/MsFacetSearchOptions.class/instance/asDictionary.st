converting
asDictionary
    | dict |
    dict := Dictionary new.
    self facetName ifNotNil: [:v | dict at: 'facetName' put: v].
    self facetQuery ifNotNil: [:v | dict at: 'facetQuery' put: v].
    self q ifNotNil: [:v | dict at: 'q' put: v].
    self filter ifNotNil: [:v | dict at: 'filter' put: v].
    self matchingStrategy ifNotNil: [:v | dict at: 'matchingStrategy' put: v].
    self attributesToSearchOn ifNotNil: [:v | dict at: 'attributesToSearchOn' put: v].
    ^ dict
