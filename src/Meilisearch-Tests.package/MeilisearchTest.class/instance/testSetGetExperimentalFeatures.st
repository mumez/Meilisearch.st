tests
testSetGetExperimentalFeatures
	| originalExperimeltalFeatures firstOptionKey isEnabled isEnabledUpdated updatedExperimeltalFeatures |
	[originalExperimeltalFeatures := meilisearch experimentalFeatures.
	firstOptionKey := originalExperimeltalFeatures optionKeys first.
	isEnabled := originalExperimeltalFeatures isEnabled: firstOptionKey.
	meilisearch experimentalFeaturesUsing: [:opts | opts at: firstOptionKey enabled: isEnabled not].
	updatedExperimeltalFeatures := meilisearch experimentalFeatures.
	isEnabledUpdated := updatedExperimeltalFeatures isEnabled: firstOptionKey.
	self assert: isEnabled equals: isEnabledUpdated not.
	] ensure: [  
	meilisearch experimentalFeaturesWithOptions: originalExperimeltalFeatures asDictionary].