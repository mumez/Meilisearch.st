actions-documents
mergeDocuments: documents optionsUsing: optionsBuilder
	| opts |
	opts := MsDocumentsWriteOptions new.
	optionsBuilder value: opts.
	^ self mergeDocuments: documents options: opts asDictionary