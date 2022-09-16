Extension { #name : 'TestAsserter' }

{ #category : '*GsBasePharoCompatibility-Core' }
TestAsserter class >> defaultPrecisionsForCloseToComparison [
	"This number comes from the one used in the Pharo Float>>#closeTo: implementation.
	 In GemStone, I am trying to avoid adding that to Float!"

	^ 0.0001
]

{ #category : '*GsBasePharoCompatibility-Core' }
TestAsserter >> assert: actualNumber closeTo: expectedNumber [
	"Tell whether the actualNumber and expectedNumber ARE close to each others with a margin of
	 the default precision (see class-side method #defaultPrecisionsForCloseToComparison).
	"
	self assert: actualNumber closeTo: expectedNumber precision: self class defaultPrecisionsForCloseToComparison
]

{ #category : '*GsBasePharoCompatibility-Core' }
TestAsserter >> assert: actualNumber closeTo: expectedNumber precision: epsilon [
	"Tell whether the actualNumber and expectedNumber ARE close to each others with a margin of epsilon."

	^ self
		assert: (actualNumber closeTo: expectedNumber precision: epsilon)
		description: actualNumber printString, ' not close enough to ', expectedNumber printString.
]

{ #category : '*GsBasePharoCompatibility-Core' }
TestAsserter >> assertEmpty: aCollection [
	^ self
		assert: aCollection isEmpty
		description: aCollection asString , ' should have been empty'
]
