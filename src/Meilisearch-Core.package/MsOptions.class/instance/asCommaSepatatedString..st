private
asCommaSepatatedString: anArray

	anArray ifNil: [ ^ '' ].
	^ ',' join: anArray