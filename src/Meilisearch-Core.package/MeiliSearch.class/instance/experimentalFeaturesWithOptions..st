actions
experimentalFeaturesWithOptions: options
	^ self httpJsonPatch: 'experimental-features' contents: options