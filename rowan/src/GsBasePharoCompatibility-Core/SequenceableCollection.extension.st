Extension { #name : 'SequenceableCollection' }

{ #category : '*GsBasePharoCompatibility-Core' }
SequenceableCollection >> allButLastDo: block [

	"Executes aBlock on each of the receiver's elements except for the last one"

	"(Array streamContents: [:stream | #(1 2 3) allButLastDo: [:each | stream nextPut: (each + 10)]]) >>> #(11 12)"

	1 to: self size - 1 do:
		[:index | block value: (self at: index)]
]

{ #category : '*GsBasePharoCompatibility-Core' }
SequenceableCollection >> copyFirst: n [
	"Answer the first n elements of the receiver.
	Raise an error if there are not enough elements."

	^ self copyFrom: 1 to: n
]

{ #category : '*GsBasePharoCompatibility-Core' }
SequenceableCollection >> withIndexCollect: elementAndIndexBlock [ 
	"Just like with:collect: except that the iteration index supplies the second argument to the block."
	
	"(#(10 20 30) withIndexCollect: [:each :index | each + (index * 2)]) >>> #(12 24 36)"
	
	| result |
	result := self species new: self size.
	1 to: self size do:
		[:index | result at: index put:
		(elementAndIndexBlock
			value: (self at: index)
			value: index)].
	^ result
]

{ #category : '*GsBasePharoCompatibility-Core' }
SequenceableCollection >> writeStream [

"Returns a WriteStream on the receiver."

^ WriteStream on: self
]
