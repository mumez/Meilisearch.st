instance creation
apiKey: apiKey url: targetUrl
	^ self new settings
		  apiKey: apiKey;
		  targetUrl: targetUrl;
			yourself