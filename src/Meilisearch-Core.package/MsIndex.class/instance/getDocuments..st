actions-documents
getDocuments: opts
	| resp |
	resp := self httpJsonPost: #('documents' 'fetch') contents: opts.
	^ MsDocumentsResponse fromDictionary: resp