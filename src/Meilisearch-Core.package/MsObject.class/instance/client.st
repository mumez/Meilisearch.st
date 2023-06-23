accessing
client

	^ client ifNil: [ client := self portableUtil createHttpJsonClient ]