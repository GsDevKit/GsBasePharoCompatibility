Class {
	#name : 'OSPlatform',
	#superclass : 'Object',
	#category : 'GsBasePharoCompatibility-Core'
}

{ #category : 'accessing' }
OSPlatform class >> current [
	"This should be more elaborate and capable, but in GemStone, it doesn't need to be."

	^ self
]

{ #category : 'accessing' }
OSPlatform class >> lineEnding [
	"Gems only run on *nix servers, so we only need
	 to worry about whether it needs to be Unicode or String."

	^String isInUnicodeComparisonMode
		ifTrue: [Unicode7 with: Character lf]
		ifFalse: [String with: Character lf]
]
