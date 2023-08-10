searching-facet
facetSearchUsing: optionsBuilder
	| opts |
	opts := MsFacetSearchOptions new.
	optionsBuilder value: opts.
	^ self facetSearchWithOptions: opts asDictionary