instance creation
response: response
	"for starting from an existing response"
	^ self new 
		response: response;
		setOptionsFromResponse: response; 
		yourself 