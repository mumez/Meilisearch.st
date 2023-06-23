actions-documents
getDocuments: opts
	^ self httpJsonPost: #('documents' 'fetch') contents: opts