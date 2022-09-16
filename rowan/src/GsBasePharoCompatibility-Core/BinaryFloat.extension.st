Extension { #name : 'BinaryFloat' }

{ #category : '*GsBasePharoCompatibility-Core' }
BinaryFloat >> closeTo: num [
 	"Tell whether the receiver and argument are close to one another.
	 Question your reliance on imprecision!"
	
	^ self closeTo: num precision: 0.0001
]

{ #category : '*GsBasePharoCompatibility-Core' }
BinaryFloat >> closeTo: num precision: aPrecision [
	"Answer whether the receiver and argument are close to each other given a precision.
	 Question your reliance on imprecision!"

	num isNumber
		ifFalse: [ 
			^ [ self = num ]
				on: Error
				do: [ :ex | false ] ].
	self = 0.0
		ifTrue: [ ^ num abs < aPrecision ].
	num = 0
		ifTrue: [ ^ self abs < aPrecision ].
	^ self = num asFloat
		or: [ (self - num) abs / (self abs max: num abs) < aPrecision ]
]

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
