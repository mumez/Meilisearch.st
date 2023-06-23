actions-http-helper
httpJsonClientDo: aBlock
	| cli resp |
	cli := self createHttpJsonClient.
	aBlock value: cli.
	resp := self signalErrorFromHttpResponseIfNeeded: cli response.
	^ self readJsonFromResponse: resp