converting
asDictionary
    | dict |
    dict := Dictionary new.
    self indexUid ifNotNil: [:v | dict at: 'indexUid' put: v].
    self q ifNotNil: [:v | dict at: 'q' put: v].
    self offset ifNotNil: [:v | dict at: 'offset' put: v].
    self limit ifNotNil: [:v | dict at: 'limit' put: v].
    self hitsPerPage ifNotNil: [:v | dict at: 'hitsPerPage' put: v].
    self hybrid ifNotNil: [:v | dict at: 'hybrid' put: v].
    self page ifNotNil: [:v | dict at: 'page' put: v].
    self filter ifNotNil: [:v | dict at: 'filter' put: v].
    self facets ifNotNil: [:v | dict at: 'facets' put: v].
    self attributesToRetrieve ifNotNil: [:v | dict at: 'attributesToRetrieve' put: v].
    self attributesToCrop ifNotNil: [:v | dict at: 'attributesToCrop' put: v].
    self cropLength ifNotNil: [:v | dict at: 'cropLength' put: v].
    self cropMarker ifNotNil: [:v | dict at: 'cropMarker' put: v].
    self attributesToHighlight ifNotNil: [:v | dict at: 'attributesToHighlight' put: v].
    self highlightPreTag ifNotNil: [:v | dict at: 'highlightPreTag' put: v].
    self highlightPostTag ifNotNil: [:v | dict at: 'highlightPostTag' put: v].
    self showMatchesPosition ifNotNil: [:v | dict at: 'showMatchesPosition' put: v].
    self sort ifNotNil: [:v | dict at: 'sort' put: v].
    self matchingStrategy ifNotNil: [:v | dict at: 'matchingStrategy' put: v].
    self showRankingScore ifNotNil: [:v | dict at: 'showRankingScore' put: v].
    self showRankingScoreDetails ifNotNil: [:v | dict at: 'showRankingScoreDetails' put: v].
    self attributesToSearchOn ifNotNil: [:v | dict at: 'attributesToSearchOn' put: v].
    self vector ifNotNil: [:v | dict at: 'vector' put: v].
    ^ dict
