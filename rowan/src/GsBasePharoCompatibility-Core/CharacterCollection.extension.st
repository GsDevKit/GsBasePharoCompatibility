Extension { #name : 'CharacterCollection' }

{ #category : '*GsBasePharoCompatibility-Core' }
CharacterCollection class >> cr [
	"Answer a string containing a single carriage return character."

	^ self with: Character cr
]

{ #category : '*GsBasePharoCompatibility-Core' }
CharacterCollection >> asUnsignedInteger [
	"Returns the first integer it can find or nil."
	| start stream |
	start := self findFirst: [ :char | char isDigit ].
	start isZero ifTrue: [ ^ nil ].
	stream := self readStream position: start - 1.
	^ Integer fromStream: stream
]

{ #category : '*GsBasePharoCompatibility-Core' }
CharacterCollection >> copySameFrom: otherObject [
	"Copy to myself all instance variables named the same in otherObject.
	 Unlike the general case, Strings don't have instance variables."

	1 to: (self basicSize min: otherObject basicSize) do: [:i |
		self basicAt: i put: (otherObject basicAt: i) asInteger].
]
