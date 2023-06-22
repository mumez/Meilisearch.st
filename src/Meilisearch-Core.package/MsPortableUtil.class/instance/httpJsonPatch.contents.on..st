actions-http-helper
httpJsonPatch: urlOrString contents: jsonString on: anHttpClient
	^ self httpJsonClientDo: [ :cli | cli patch: urlOrString asString contents: jsonString ]