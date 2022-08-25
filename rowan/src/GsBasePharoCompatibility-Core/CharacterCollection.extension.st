Extension { #name : 'CharacterCollection' }

{ #category : '*GsBasePharoCompatibility-Core' }
CharacterCollection class >> cr [
	"Answer a string containing a single carriage return character."

	^ self with: Character cr
]

{ #category : '*GsBasePharoCompatibility-Core' }
CharacterCollection class >> lf [
	"Answer a string containing a single line feed character."

	^ self with: Character lf
]

{ #category : '*GsBasePharoCompatibility-Core' }
CharacterCollection >> asDate [
	"Only supports ISO date format.
		'1984-12-23' asDate "

	^ Date fromString: self usingFormat: #(3 2 1 $- 1 1).
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
CharacterCollection >> capitalized [
	"Return a copy with the first letter capitalized"
	| cap |
	self isEmpty ifTrue: [ ^self copy ].
	cap := self copy.
	cap at: 1 put: (cap at: 1) asUppercase.
	^ cap
]

{ #category : '*GsBasePharoCompatibility-Core' }
CharacterCollection >> copySameFrom: otherObject [
	"Copy to myself all instance variables named the same in otherObject.
	 Unlike the general case, Strings don't have instance variables."

	1 to: (self basicSize min: otherObject basicSize) do: [:i |
		self basicAt: i put: (otherObject basicAt: i) asInteger].
]

{ #category : '*GsBasePharoCompatibility-Core' }
CharacterCollection >> includesSubstring: aCharacterCollection [
	"Not quite identical to Pharo's implementation. This one ignores case."

	^ self includesString: aCharacterCollection
]
