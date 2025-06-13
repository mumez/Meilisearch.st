tests - common
createIndexNamed: newIndexId documents: documents do: testingBlock
	self createIndexNamed: newIndexId then: [:idx| ] documents: documents do: testingBlock