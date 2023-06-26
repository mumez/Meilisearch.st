private
createHttpJsonClient
	| cli |
  cli := self createHttpClient.
  cli accept: ZnMimeType applicationJson.
  cli
    contentWriter: [ :o | 
      (ZnStringEntity type: ZnMimeType applicationJson)
        string: (self jsonStringFrom: o) ].
  cli request setAuthorization: 'Bearer ' , self settings apiKey.
  ^ cli