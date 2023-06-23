actions-documents
putDocuments: documents options: optionsDict
	^ self httpJsonPost: 'documents' params: optionsDict contents: documents.