accessing
targetUrl
	^self at: #targetUrl ifAbsentPut: [self defaultTargetUrl]