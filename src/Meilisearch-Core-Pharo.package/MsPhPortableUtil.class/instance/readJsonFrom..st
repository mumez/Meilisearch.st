private
readJsonFrom: aStream
	^ (NeoJSONReader on: aStream) next