private
setOptionsFromResponse: aResponse
	self page: aResponse page.
	self hitsPerPage: aResponse hitsPerPage