Extension { #name : 'AbstractDictionary' }

{ #category : '*GsBasePharoCompatibility-Core' }
AbstractDictionary class >> newFromKeys: keys andValues: values [
	"Create a dictionary from the keys and values arguments which should have the same length."
	"(Dictionary newFromKeys: #(#x #y) andValues: #(3 6)) >>> (Dictionary new at: #x put: 3; at: #y put: 6 ;yourself)"
	
	| dict |
	dict := self new.
	keys with: values do: [ :k :v | dict at: k put: v ].
	^ dict
]

{ #category : '*GsBasePharoCompatibility-Core' }
AbstractDictionary class >> newFromPairs: aSequenceableCollection [
  | newDictionary |
  newDictionary := self new: (aSequenceableCollection size / 2) floor.
  1 to: aSequenceableCollection size - 1 by: 2 do: [ :i | 
    newDictionary
      at: (aSequenceableCollection at: i)
      put: (aSequenceableCollection at: i + 1) ].
  ^ newDictionary
]

{ #category : '*GsBasePharoCompatibility-Core' }
AbstractDictionary >> at: key ifPresent: aPresentBlock ifAbsent: anAbsentBlock [
	"Lookup the given key in the receiver. If it is present, answer the
	value of evaluating the first block optionally with the value associated
	with the key.
	Otherwise answer the value of the second block."

	self at: key ifPresent: [:v | ^ aPresentBlock cull: v].
	^ anAbsentBlock value
]

{ #category : '*GsBasePharoCompatibility-Core' }
AbstractDictionary >> keysSortedSafely [
	"Answer an Array containing the receiver's keys."
	"Suggested by l. Uzonyi"

	| sortedKeys |
	sortedKeys := Array
							new: self size
							streamContents: [ :stream |
									self keysDo: [ :each | stream nextPut: each ] ].
	"Customized for GemStone, since its #sort: answers a new collection."
	^sortedKeys sort: [ :x :y |
		"Should really be use <obj, string, num> compareSafely..."
		((x isString and: [ y isString ])
			or: [ x isNumber and: [ y isNumber ] ])
			ifTrue: [ x < y ]
			ifFalse: [ x class == y class
				ifTrue: [ x printString < y printString ]
				ifFalse: [ x class name < y class name ] ] ].
	"^sortedKeys"
]

{ #category : '*GsBasePharoCompatibility-Core' }
AbstractDictionary >> removeAll [
	"Override the inherited behavior since dictionaries don't like #removeAll:/"

	self removeAllKeys: self keys
]
