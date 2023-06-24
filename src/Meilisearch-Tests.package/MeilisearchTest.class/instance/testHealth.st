tests
testHealth
	| status |
	status := meilisearch health.
	self assert: status equals: 'available'