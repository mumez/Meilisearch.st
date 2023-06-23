actions-documents
getDocumentsUsing: optionsBuilder
	| opts |
	opts := MsDocumentsReadOptions new.
	optionsBuilder value: opts.
	^ self getDocuments: opts asDictionary