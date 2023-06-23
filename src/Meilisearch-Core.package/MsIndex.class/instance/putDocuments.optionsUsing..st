actions-documents
putDocuments: documents optionsUsing: optionsBuilder
	| opts |
	opts := MsDocumentsWriteOptions new.
	optionsBuilder value: opts.
	^ self putDocuments: documents options: opts 