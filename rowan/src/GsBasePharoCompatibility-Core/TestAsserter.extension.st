Extension { #name : 'TestAsserter' }

{ #category : '*GsBasePharoCompatibility-Core' }
TestAsserter >> assert: aFloat closeTo: anotherFloat [
	"Fix any implementations which do not give equal results.
	 Don't use sloppy tests.
	 And, especially don't let broken implementations get away with it.
	 Currently, no ported senders of this method. KEEP it so that we
	 retain the explanation above for future ports."

	self assert: aFloat equals: anotherFloat
]

{ #category : '*GsBasePharoCompatibility-Core' }
TestAsserter >> assertEmpty: aCollection [
	^ self
		assert: aCollection isEmpty
		description: aCollection asString , ' should have been empty'
]
