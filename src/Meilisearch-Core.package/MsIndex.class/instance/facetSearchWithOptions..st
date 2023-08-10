searching-facet
facetSearchWithOptions: options
	| resp |
	resp := self httpJsonPost: 'facet-search' contents: options.
	^ MsFacetSearchResponse fromDictionary: resp