tests - common
createIndexNamed: newIndexId then: indexBlock documents: documents do: testingBlock
	| index |
	[
	index := self createIndexNamed: newIndexId then: indexBlock documents: documents.
	testingBlock value: index ] ensure: [
		index ifNotNil: [ self deleteAllDocumentsIn: index ] ]