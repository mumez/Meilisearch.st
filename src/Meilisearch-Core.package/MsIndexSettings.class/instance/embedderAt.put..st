accessing-embedders
embedderAt: embedderName put: anEmbedderOptions
	embedders ifNil: [ embedders := Dictionary new ].
	embedderName at: embedderName put: anEmbedderOptions asDictionary