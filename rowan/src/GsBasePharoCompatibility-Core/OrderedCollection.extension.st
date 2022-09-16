Extension { #name : 'OrderedCollection' }

{ #category : '*GsBasePharoCompatibility-Core' }
OrderedCollection >> select: selectBlock thenCollect: collectBlock [
    " Optimized version Collection>>#select:thenCollect: "

	| newCollection element |

    newCollection := self copyEmpty.

    1 to: self size do: [ :index |
		element := self at: index.
		(selectBlock value: element) 
			ifTrue: [ newCollection addLast: (collectBlock value: element) ]].

    ^ newCollection
]
