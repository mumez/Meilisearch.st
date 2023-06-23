actions-documents
mergeDocuments: documents options: optionsDict
	^ self httpJsonPut: 'documents' params: optionsDict contents: documents.