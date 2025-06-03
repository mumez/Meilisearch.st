embedder-settings
removeEmbedder: embedderName 
	| allEmbedderOptions |
	allEmbedderOptions := Dictionary new.
	allEmbedderOptions at: embedderName put: nil.
	^ self setEmbedders: allEmbedderOptions