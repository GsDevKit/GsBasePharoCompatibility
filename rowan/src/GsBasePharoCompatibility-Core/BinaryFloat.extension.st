Extension { #name : 'BinaryFloat' }

{ #category : '*GsBasePharoCompatibility-Core' }
BinaryFloat >> isFinite [
	"simple, byte-order independent test for rejecting Not-a-Number and (Negative)Infinity"

	^(self - self) = 0.0
]

{ #category : '*GsBasePharoCompatibility-Core' }
BinaryFloat >> isFloat [

	^ true
]

{ #category : '*GsBasePharoCompatibility-Core' }
BinaryFloat >> isNaN [

	^ self _isNaN
]

{ #category : '*GsBasePharoCompatibility-Core' }
BinaryFloat >> isZero [

	^self = 0.0d0
]
