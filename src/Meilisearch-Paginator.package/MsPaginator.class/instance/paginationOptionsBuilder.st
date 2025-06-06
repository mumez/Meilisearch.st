accessing
paginationOptionsBuilder

	^ paginationOptionsBuilder ifNil: [ paginationOptionsBuilder := self defaultPaginationOptionsBuilder ]