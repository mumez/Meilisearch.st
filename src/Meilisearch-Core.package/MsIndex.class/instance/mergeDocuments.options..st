actions-documents
mergeDocuments: documents options: optionsDict
	| resp |
	resp := self httpJsonPut: 'documents' params: optionsDict contents: documents.
	^ self asTask: resp