Extension { #name : 'Collection' }

{ #category : '*GsBasePharoCompatibility-Core' }
Collection >> anyOne [

	^self any
]

{ #category : '*GsBasePharoCompatibility-Core' }
Collection >> associationsDo: aBlock [
	"Evaluate aBlock for each of the receiver's elements (key/value 
	associations).  If any non-association is within, the error is not caught now,
	but later, when a key or value message is sent to it."

	self do: aBlock
]

{ #category : '*GsBasePharoCompatibility-Core' }
Collection >> count: aBlock [ 
	"Evaluate aBlock with each of the receiver's elements as the argument.  
	Answer the number of elements that answered true."
	"(#(1 2 3 4) count: [ :each | each even ]) >>> 2"

	| sum |
	sum := 0.
	self do: [:each | (aBlock value: each) ifTrue: [sum := sum + 1]].
	^ sum
]

{ #category : '*GsBasePharoCompatibility-Core' }
Collection >> emptyCheck [

	self isEmpty ifTrue: [self errorEmptyCollection]
]

{ #category : '*GsBasePharoCompatibility-Core' }
Collection >> errorEmptyCollection [
	"Signal a CollectionIsEmpty exception"
	
	CollectionIsEmpty signalWith: self
]

{ #category : '*GsBasePharoCompatibility-Core' }
Collection >> errorNotFound: anObject [
	"Raise the GemStone/S equivalent to Pharo's NotFound exception."

	LookupError signal: anObject printString , ' not found'
]

{ #category : '*GsBasePharoCompatibility-Core' }
Collection >> removeAll [
	"Remove each element from the receiver and leave it empty.
	ArrayedCollections cannot respond to this message.
	There are two good reasons why a subclass should override this message:
	1) the subclass does not support being modified while being iterated
	2) the subclass provides a much faster way than iterating through each element"

	self removeAll: self
]

{ #category : '*GsBasePharoCompatibility-Core' }
Collection >> select: selectBlock thenCollect: collectBlock [
	"Utility method to improve readability."

	^ (self select: selectBlock) collect: collectBlock
]
