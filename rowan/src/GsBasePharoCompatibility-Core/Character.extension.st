Extension { #name : 'Character' }

{ #category : '*GsBasePharoCompatibility-Core' }
Character class >> HACKEDOUTescape [
	"Answer the ASCII ESC character"

	^Esc
]

{ #category : '*GsBasePharoCompatibility-Core' }
Character >> sameAs: aCharacter [
	"Answer whether the receiver is equal to aCharacter, ignoring case"

	^ self asLowercase = aCharacter asLowercase
]
