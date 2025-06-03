initialization
initFromDictionary: aDictionary
	aDictionary at: 'source' ifPresent: [ :v | self source: v ].
	aDictionary at: 'url' ifPresent: [ :v | self url: v ].
	aDictionary at: 'apiKey' ifPresent: [ :v | self apiKey: v ].
	aDictionary at: 'model' ifPresent: [ :v | self model: v ].
	aDictionary at: 'documentTemplate' ifPresent: [ :v | self documentTemplate: v ].
	aDictionary at: 'documentTemplateMaxBytes' ifPresent: [ :v | self documentTemplateMaxBytes: v ].
	aDictionary at: 'dimensions' ifPresent: [ :v | self dimensions: v ].
	aDictionary at: 'revision' ifPresent: [ :v | self revision: v ].
	aDictionary at: 'distribution' ifPresent: [ :v | self distribution: v ].
	aDictionary at: 'request' ifPresent: [ :v | self request: v ].
	aDictionary at: 'response' ifPresent: [ :v | self response: v ].
	aDictionary at: 'binaryQuantized' ifPresent: [ :v | self binaryQuantized: v ].
	aDictionary at: 'indexingEmbedder' ifPresent: [ :v | self indexingEmbedder: v ].
	aDictionary at: 'searchEmbedder' ifPresent: [ :v | self searchEmbedder: v ].
	aDictionary at: 'pooling' ifPresent: [ :v | self pooling: v ].