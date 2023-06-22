private
createHttpJsonClient
	| cli |
	cli := self createHttpClient.
	cli forJsonREST.
	cli setBearerAuthentication: self settings apiKey.
	^ cli