accessing
settings

	^ settings ifNil: [ settings := MsSettings fromDefault ]