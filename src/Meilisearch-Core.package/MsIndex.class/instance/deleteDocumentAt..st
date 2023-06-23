actions-documents
deleteDocumentAt: documentId
	^ self httpJsonDelete: (Array with: 'documents' with: documentId)