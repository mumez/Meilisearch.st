actions-documents
getDocumentsBy: filter offset: offset limit: limit
	^ self getDocumentsUsing: [ :opts |
		  opts
			  offset: offset;
			  limit: limit.

		  (filter isNil or: [ filter isEmpty ]) ifFalse: [
			  opts filter: filter ] ]