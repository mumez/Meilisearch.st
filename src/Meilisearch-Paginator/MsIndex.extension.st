Extension { #name : 'MsIndex' }

{ #category : '*Meilisearch-Paginator' }
MsIndex >> numberedPagePaginator [
	^ MsNumberedPagePaginator on: self
]

{ #category : '*Meilisearch-Paginator' }
MsIndex >> offsetPaginator [
	^ MsOffsetPaginator on: self
]
