class initialization
initialize
	Settings := MsSettings fromDefault.
	
	"Please edit for your environment"
	Settings targetUrl: 'http://127.0.0.1:7700'.
	"Settings apiKey: 'your-api-key'"