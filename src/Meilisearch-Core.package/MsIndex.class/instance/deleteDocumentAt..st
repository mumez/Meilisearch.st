actions-documents
deleteDocumentAt: documentId
	| resp |
	resp := self httpJsonDelete: (Array with: 'documents' with: documentId asString).
	^ self asTask: resp