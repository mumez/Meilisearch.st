actions-documents
putDocuments: documents options: optionsDict
	| resp |
	resp := self httpJsonPost: 'documents' params: optionsDict contents: documents.
	^ self asTask: resp