Extension { #name : 'AbstractException' }

{ #category : '*GsBasePharoCompatibility-Core' }
AbstractException >> signaler [
	"Ported from Pharo. The signaller is the object
	 which raised the exception."

	^ gsArgs at: 1 ifAbsent: [nil]
]

{ #category : '*GsBasePharoCompatibility-Core' }
AbstractException >> signaler: anObject [
	"Ported from Pharo. The signaller is the object
	 which raised the exception."

	self arg: anObject
]
