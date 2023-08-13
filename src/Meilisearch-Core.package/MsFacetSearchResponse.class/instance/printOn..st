printing
printOn: aStream
    super printOn: aStream.
    aStream
        nextPutAll: ' facetHits: ';
        print: facetHits;
        nextPutAll: ' facetQuery: ';
        print: facetQuery;
        nextPutAll: ' processingTimeMs: ';
        print: processingTimeMs.
