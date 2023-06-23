accessing
messageText
	^ messageText ifNil: [self kind asString]