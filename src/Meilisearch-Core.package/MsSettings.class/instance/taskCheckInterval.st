accessing
taskCheckInterval
	^self at: #taskCheckInterval ifAbsentPut: [100]