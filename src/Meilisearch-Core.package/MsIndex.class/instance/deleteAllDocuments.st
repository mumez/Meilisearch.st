actions-documents
deleteAllDocuments
	^ self asTask: (self httpJsonDelete: 'documents')