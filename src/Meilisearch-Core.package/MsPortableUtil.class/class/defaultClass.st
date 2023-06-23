defaults
defaultClass
	ActualClass ifNil: [ActualClass := ((MsPortableUtil subclasses at: 1) activate)].
	^ ActualClass