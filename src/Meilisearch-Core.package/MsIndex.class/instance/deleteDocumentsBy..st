actions-documents
deleteDocumentsBy: filter
	| conts |
	conts := { ('filter' -> filter) } asDictionary.
	^ self asTask:
		  (self httpJsonPost: #( 'documents' 'delete' ) contents: conts)