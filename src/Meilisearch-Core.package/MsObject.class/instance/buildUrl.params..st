building
buildUrl: pathComponents params: params
	| url |
	url := self buildUrl: pathComponents.
	url := url , (self portableUtil queryParamsStringFrom: params).
	^ url