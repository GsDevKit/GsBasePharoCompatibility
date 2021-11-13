Extension { #name : 'Collection' }

{ #category : '*GsBasePharoCompatibiity-Core' }
Collection >> associationsDo: aBlock [
	"Evaluate aBlock for each of the receiver's elements (key/value 
	associations).  If any non-association is within, the error is not caught now,
	but later, when a key or value message is sent to it."

	self do: aBlock
]

{ #category : '*GsBasePharoCompatibiity-Core' }
Collection >> removeAll [
	"Remove each element from the receiver and leave it empty.
	ArrayedCollections cannot respond to this message.
	There are two good reasons why a subclass should override this message:
	1) the subclass does not support being modified while being iterated
	2) the subclass provides a much faster way than iterating through each element"

	self removeAll: self
]

{ #category : '*GsBasePharoCompatibiity-Core' }
Collection >> withIndexDo: elementAndIndexBlock [
	"Just like do: except that the iteration index supplies the second argument to the block"
	"Support collection enumeration with a counter, even though not ordered"

	^self doWithIndex: elementAndIndexBlock.
"Arguably, #withIndexDo: is more correct and consistent than #doWithIndex.
 Consider #with:do: for an example of the with coming before the do.
 RJS 2021-11-08"
]
