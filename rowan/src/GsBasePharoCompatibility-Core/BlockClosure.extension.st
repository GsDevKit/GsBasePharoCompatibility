Extension { #name : 'BlockClosure' }

{ #category : '*GsBasePharoCompatibility-Core' }
BlockClosure >> assertWithDescription: aStringOrABlock [
	| value |
	self value
		ifTrue: [ ^ self ].
	value := aStringOrABlock value.
	TestResult failure signal: value
]

{ #category : '*GsBasePharoCompatibility-Core' }
BlockClosure >> isBlock [

	^ true
]
