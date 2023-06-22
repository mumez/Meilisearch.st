read/write
jsonStringFrom: valueOrAssocs 
	| dict rawJsonString param |
	((valueOrAssocs isArray or: [valueOrAssocs class = OrderedCollection])
		and: [valueOrAssocs notEmpty and: [valueOrAssocs first isKindOf: Association]])
		ifTrue: [dict := valueOrAssocs asDictionary.
			param := dict]
		ifFalse: [param := valueOrAssocs].
	rawJsonString := NeoJSONWriter toString: param.
	^ rawJsonString