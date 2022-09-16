Extension { #name : 'Number' }

{ #category : '*GsBasePharoCompatibility-Core' }
Number >> closeTo: num [
 	"Tell whether the receiver and argument are close to one another.
	 Question your reliance on imprecision!"

	num isFloat
		ifTrue: [ ^ num closeTo: self asFloat ].
	^ [ self = num ]
		on: Error
		do: [ :ex | false ]
]

{ #category : '*GsBasePharoCompatibility-Core' }
Number >> closeTo: num precision: aPrecision [
	"Answer whether the receiver and argument are close to each other given a precision.
	 Question your reliance on imprecision!"

	num isFloat
		ifTrue: [ ^ num closeTo: self asFloat precision: aPrecision ].
	^ [ self = num ]
		on: Error
		do: [ :ex | false ]
]

{ #category : '*GsBasePharoCompatibility-Core' }
Number >> day [
 
 	^ self days
]

{ #category : '*GsBasePharoCompatibility-Core' }
Number >> days [
 
 	^ Duration days: self
]

{ #category : '*GsBasePharoCompatibility-Core' }
Number >> hour [
 
 	^ self hours
]

{ #category : '*GsBasePharoCompatibility-Core' }
Number >> hours [
 
 	^ Duration hours: self
]

{ #category : '*GsBasePharoCompatibility-Core' }
Number >> isZero [

	^self = 0.
]

{ #category : '*GsBasePharoCompatibility-Core' }
Number >> log [

	^self log: 10.
]

{ #category : '*GsBasePharoCompatibility-Core' }
Number >> microsecond [
	
 	^ self microseconds
]

{ #category : '*GsBasePharoCompatibility-Core' }
Number >> microseconds [
	"2 microseconds printString >>> '0:00:00:00.000' (GemStone truncates printing to milliseconds)"
	"(1 second + 2 microseconds) printString >>> '0:00:00:01.000' (GemStone truncates printing to milliseconds)"
	
 	^ Duration microseconds: self
]

{ #category : '*GsBasePharoCompatibility-Core' }
Number >> millisecond [
	"millisecond is more correct than milliSecond"
	"1 millisecond printString >>> '0:00:00:00.001'"
	"(1 second + 1 millisecond) printString >>> '0:00:00:01.001'"
	
 	^ self milliseconds
]

{ #category : '*GsBasePharoCompatibility-Core' }
Number >> milliSecond [
	"millisecond is more correct than milliSecond"
	"1 milliSecond printString >>> '0:00:00:00.001'"
	"(1 second + 1 milliSecond) printString >>> '0:00:00:01.001'"
	
 	^ self milliseconds
]

{ #category : '*GsBasePharoCompatibility-Core' }
Number >> milliseconds [
	"milliseconds is more correct than milliSeconds"
	"2 milliseconds printString >>> '0:00:00:00.002'"
	"(1 second + 2 milliseconds) printString >>> '0:00:00:01.002'"
	
 	^ Duration milliseconds: self
]

{ #category : '*GsBasePharoCompatibility-Core' }
Number >> milliSeconds [
	"milliseconds is more correct than milliSeconds"
	"2 milliSeconds printString >>> '0:00:00:00.002'"
	"(1 second + 2 milliSeconds) printString >>> '0:00:00:01.002'"
	
 	^ self milliseconds
]

{ #category : '*GsBasePharoCompatibility-Core' }
Number >> minute [
	"1 minute printString >>> '0:00:01:00'"
	"(1 hour + 1 minute) printString >>> '0:01:01:00'"
 
 	^ self minutes
]

{ #category : '*GsBasePharoCompatibility-Core' }
Number >> minutes [
	"2 minutes printString >>> '0:00:02:00'"
	"(1 hour + 2 minutes) printString >>> '0:01:02:00'"
 
 	^ Duration minutes: self
]

{ #category : '*GsBasePharoCompatibility-Core' }
Number >> nanosecond [
	"nanosecond is more correct than nanoSecond"
	"1 nanosecond printString >>> '0:00:00:00.000' (GemStone truncates printing to milliseconds)"
	"(1 millisecond + 1 nanosecond) printString >>> '0:00:00:00.001' (GemStone truncates printing to milliseconds)"
 
 	^ self nanoseconds
]

{ #category : '*GsBasePharoCompatibility-Core' }
Number >> nanoSecond [
	"nanosecond is more correct than nanoSecond"
	"1 nanoSecond printString >>> '0:00:00:00.000' (GemStone truncates printing to milliseconds)"
	"(1 milliSecond + 1 nanoSecond) printString >>> '0:00:00:00.001' (GemStone truncates printing to milliseconds)"
 
 	^ self nanoseconds
]

{ #category : '*GsBasePharoCompatibility-Core' }
Number >> nanoseconds [
	"nanoseconds is more correct than nanoSeconds"
	"2 nanoseconds printString >>> '0:00:00:00.000' (GemStone truncates printing to milliseconds)"
	"(1 millisecond + 2 nanoseconds) printString >>> '0:00:00:00.001' (GemStone truncates printing to milliseconds)"
 
 	^ Duration nanoseconds: self.
]

{ #category : '*GsBasePharoCompatibility-Core' }
Number >> nanoSeconds [
	"nanoseconds is more correct than nanoSeconds"
	"2 nanoSeconds printString >>> '0:00:00:00.000' (GemStone truncates printing to milliseconds)"
	"(1 milliSecond + 2 nanoSeconds) printString >>> '0:00:00:00.001' (GemStone truncates printing to milliseconds)"
 
 	^ self nanoseconds
]

{ #category : '*GsBasePharoCompatibility-Core' }
Number >> second [
	"1 second printString >>> '0:00:00:01'"
	"(1 minute + 1 second) printString >>> '0:00:01:01'"
	
 	^ self seconds
]

{ #category : '*GsBasePharoCompatibility-Core' }
Number >> seconds [

	"2 seconds printString >>> '0:00:00:02'"
	"(1 minute + 2 seconds) printString >>> '0:00:01:02'"
 
 	^ Duration seconds: self
]
