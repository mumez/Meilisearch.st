embedder-settings
setEmbedders: aDictionary
	^ self applySettingsUsing: [ :opts |
		  opts embedders: aDictionary ]