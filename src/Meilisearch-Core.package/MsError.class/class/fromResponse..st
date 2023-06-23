instance creation
fromResponse: response
	| code |
	code := response code.
	code = 204 ifTrue: [^ (self response: response kind: #NoContent) ].
	code = 401
		ifTrue: [^ (self response: response kind: #Unauthorized) ].
	code = 404
		ifTrue: [^ (self response: response kind: #NotFound) ].
	code = 409 ifTrue: [^ (self response: response kind: #CannotDelete) ].
	^ (self response: response kind: #Generic) signal