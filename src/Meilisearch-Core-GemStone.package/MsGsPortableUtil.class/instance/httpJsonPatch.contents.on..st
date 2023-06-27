actions-http-helper
httpJsonPatch: urlOrString contents: jsonString on: anHttpClient
  ^ self
    httpJsonClientDo: [ :cli | 
      cli
        url: urlOrString asString;
        contents: jsonString;
        method: #'PATCH';
        execute ]