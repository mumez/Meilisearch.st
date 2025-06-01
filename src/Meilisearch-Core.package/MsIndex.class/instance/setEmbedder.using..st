embedder-settings
setEmbedder: embedderName using: optionsBuilder
	| options allEmbedderOptions |
	options := MsEmbedderOptions new.
	optionsBuilder value: options.
	allEmbedderOptions := Dictionary new.
	allEmbedderOptions at: embedderName put: options asDictionary.
	^ self setEmbedders: allEmbedderOptions