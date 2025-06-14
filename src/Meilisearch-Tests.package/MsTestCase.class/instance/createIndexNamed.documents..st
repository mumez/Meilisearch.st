tests - common
createIndexNamed: newIndexId documents: documents
	^ self createIndexNamed: newIndexId then: [:idx | ] documents: documents