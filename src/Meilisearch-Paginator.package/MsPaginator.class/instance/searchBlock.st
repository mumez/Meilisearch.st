accessing
searchBlock

	^ searchBlock ifNil: [ searchBlock := self defaultSearchBlock ]