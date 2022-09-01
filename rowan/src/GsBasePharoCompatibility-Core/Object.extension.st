Extension { #name : 'Object' }

{ #category : '*GsBasePharoCompatibility-Core' }
Object class >> newFrom: aSimilarObject [
	"Create an object that has similar contents to aSimilarObject. If the classes have any instance variables with the same names, copy them across. If this is bad for a class, override this method."

	^ (self isVariable
		ifTrue: [self basicNew: aSimilarObject basicSize]
		ifFalse: [self basicNew]) copySameFrom: aSimilarObject
]

{ #category : '*GsBasePharoCompatibility-Core' }
Object >> as: aSimilarClass [
	"Create an object of class aSimilarClass that has similar contents to the receiver if the object is not already an instance of this class."

	aSimilarClass == self class ifTrue: [ ^ self ].

	^ aSimilarClass newFrom: self
]

{ #category : '*GsBasePharoCompatibility-Core' }
Object >> copySameFrom: otherObject [
	"Copy to myself all instance variables named the same in otherObject.
	This ignores otherObject's control over its own inst vars."

	| myInstVars otherInstVars |
	myInstVars := self class allInstVarNames.
	otherInstVars := otherObject class allInstVarNames.
	myInstVars doWithIndex: [:each :index | | match |
		(match := otherInstVars indexOf: each) > 0 ifTrue:
			[self instVarAt: index put: (otherObject instVarAt: match)]].
	1 to: (self basicSize min: otherObject basicSize) do: [:i |
		self basicAt: i put: (otherObject basicAt: i)].
]

{ #category : '*GsBasePharoCompatibility-Core' }
Object >> isBlock [

	^ false
]

{ #category : '*GsBasePharoCompatibility-Core' }
Object >> isDecimalFloat [

	^ false
]

{ #category : '*GsBasePharoCompatibility-Core' }
Object >> isFixedPoint [

	^ false
]

{ #category : '*GsBasePharoCompatibility-Core' }
Object >> isFloat [

	^ false
]

{ #category : '*GsBasePharoCompatibility-Core' }
Object >> isFraction [

	^ false
]

{ #category : '*GsBasePharoCompatibility-Core' }
Object >> isInteger [

	^ false
]

{ #category : '*GsBasePharoCompatibility-Core' }
Object >> isNotNil [
	"Pharo implements both, so we'll alias it."

	^self notNil
]

{ #category : '*GsBasePharoCompatibility-Core' }
Object >> isScaledDecimal [

	^ false
]
