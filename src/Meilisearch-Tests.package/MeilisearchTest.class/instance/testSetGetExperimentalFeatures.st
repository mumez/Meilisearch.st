tests
testSetGetExperimentalFeatures
	| originalExperimeltalFeatures updatedExperimeltalFeatures |
	[originalExperimeltalFeatures := meilisearch experimentalFeatures.
	meilisearch experimentalFeaturesUsing: [:opts | opts vectorStore: true; scoreDetails: false].
	updatedExperimeltalFeatures := meilisearch experimentalFeatures.
	self assert: updatedExperimeltalFeatures vectorStore equals: true.
	self assert: updatedExperimeltalFeatures scoreDetails equals: false.
	meilisearch experimentalFeaturesUsing: [:opts | opts vectorStore: false; scoreDetails: true].
	updatedExperimeltalFeatures := meilisearch experimentalFeatures.
	self assert: updatedExperimeltalFeatures vectorStore equals: false.
	self assert: updatedExperimeltalFeatures scoreDetails equals: true.
	] ensure: [  
	meilisearch experimentalFeaturesWithOptions: originalExperimeltalFeatures].