requesting
buildUrl: pathComponents
	| url |
	url := self portableUtil concatPath: self settings targetUrl withAll: pathComponents.
	^ url