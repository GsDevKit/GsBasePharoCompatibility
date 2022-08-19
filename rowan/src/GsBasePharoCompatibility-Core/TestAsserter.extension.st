Extension { #name : 'TestAsserter' }

{ #category : '*GsBasePharoCompatibility-Core' }
TestAsserter >> assertEmpty: aCollection [
	^ self
		assert: aCollection isEmpty
		description: aCollection asString , ' should have been empty'
]
