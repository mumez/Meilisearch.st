accessing
settings
	^ settings ifNil: [settings := MsSettings default]