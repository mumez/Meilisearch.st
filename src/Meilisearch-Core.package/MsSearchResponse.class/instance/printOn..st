printing
printOn: aStream
	super printOn: aStream.
	aStream
		nextPutAll: ' hits: ';
		print: hits.
	aStream
		nextPutAll: ' offset: ';
		print: offset.
	aStream
		nextPutAll: ' limit: ';
		print: limit.
	aStream
		nextPutAll: ' estimatedTotalHits: ';
		print: estimatedTotalHits.
	aStream
		nextPutAll: ' totalHits: ';
		print: totalHits.
	aStream
		nextPutAll: ' totalPages: ';
		print: totalPages.
	aStream
		nextPutAll: ' hitsPerPage: ';
		print: hitsPerPage.
	aStream
		nextPutAll: ' page: ';
		print: page.
	aStream
		nextPutAll: ' facetDistribution: ';
		print: facetDistribution.
	aStream
		nextPutAll: ' facetStats: ';
		print: facetStats.
	aStream
		nextPutAll: ' processingTimeMs: ';
		print: processingTimeMs.
	aStream
		nextPutAll: ' query: ';
		print: query.
