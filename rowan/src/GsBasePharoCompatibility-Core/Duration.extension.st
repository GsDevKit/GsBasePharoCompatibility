Extension { #name : 'Duration' }

{ #category : '*GsBasePharoCompatibility-Core' }
Duration class >> days: aNumber [

	^ self seconds: aNumber * Time secondsPerDay nanoseconds: 0
]

{ #category : '*GsBasePharoCompatibility-Core' }
Duration class >> hours: aNumber [

	^ self seconds: aNumber * Time secondsPerHour nanoseconds: 0
]

{ #category : '*GsBasePharoCompatibility-Core' }
Duration class >> microseconds: microCount [

	^ self seconds: microCount / 1000000
]

{ #category : '*GsBasePharoCompatibility-Core' }
Duration class >> milliseconds: milliCount [
	"milliseconds is more correct than milliSeconds"

	^ self seconds: milliCount / 1000
]

{ #category : '*GsBasePharoCompatibility-Core' }
Duration class >> milliSeconds: milliCount [
	"milliseconds is more correct than milliSeconds"

	^ self milliseconds: milliCount
]

{ #category : '*GsBasePharoCompatibility-Core' }
Duration class >> minutes: aNumber [

	^ self seconds: aNumber * Time secondsPerMinute nanoseconds: 0
]

{ #category : '*GsBasePharoCompatibility-Core' }
Duration class >> nanoseconds: nanos [
	"nanoseconds is more correct than nanoSeconds"

	^ self seconds: 0 nanoseconds: nanos
]

{ #category : '*GsBasePharoCompatibility-Core' }
Duration class >> nanoSeconds: nanos [
	"nanoseconds is more correct than nanoSeconds"

	^ self nanoseconds: nanos
]

{ #category : '*GsBasePharoCompatibility-Core' }
Duration class >> seconds: seconds nanoseconds: nanos [
	"Don't waste time in the (many) cases where nanos is zero."
	"nanoseconds is more correct than nanoSeconds"

	| secs |
	secs := nanos = 0
		ifTrue: [ seconds ]
		ifFalse: [ seconds + (nanos / 1000000000) ].
	^ self seconds: secs
]

{ #category : '*GsBasePharoCompatibility-Core' }
Duration class >> seconds: seconds nanoSeconds: nanos [
	"Don't waste time in the (many) cases where nanos is zero."
	"nanoseconds is more correct than nanoSeconds"

	^ self seconds: seconds nanoseconds: nanos
]
