instance creation
inheritFrom: aSettings
	| inst |
	inst := self new.
	aSettings settingsDict keysAndValuesDo: [ :k :v | inst at: k put: v ].
	^ inst