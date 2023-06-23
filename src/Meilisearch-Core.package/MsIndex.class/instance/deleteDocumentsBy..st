actions-documents
deleteDocumentsBy: filter
	| conts |
	conts := { ('filter' -> filter) } asDictionary.
	^ self
		  httpJsonPost: #('documents' 'delete')
		  contents: conts