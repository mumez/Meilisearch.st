building
buildUrl: pathComponents
	| url |
	url := self portableUtil concatPath: self buildBaseUrl withAll: pathComponents.
	^ url