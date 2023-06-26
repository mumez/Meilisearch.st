accessing
index: indexUid
	| uid |
	uid := indexUid isString
		       ifTrue: [ indexUid ]
		       ifFalse: [ indexUid uid ].
	^ self indexUid: uid