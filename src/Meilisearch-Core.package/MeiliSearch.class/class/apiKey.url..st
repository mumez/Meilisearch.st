instance creation
apiKey: apiKey url: targetUrl
	| inst |
	inst := self apiKey: apiKey.
	inst settings targetUrl: targetUrl.
	^ inst