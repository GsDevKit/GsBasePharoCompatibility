Extension { #name : 'Character' }

{ #category : '*GsBasePharoCompatibility-Core' }
Character class >> escape [
	"Answer the ASCII ESC character"

	^self codePoint: 27
]

{ #category : '*GsBasePharoCompatibility-Core' }
Character class >> newPage [
	"Answer the Character representing a form feed."

	^self codePoint: 12
]
