actions-documents
deleteAllDocuments
	^ self httpJsonDelete: 'documents'