Extension { #name : 'Symbol' }

{ #category : '*GsBasePharoCompatibility-Core' }
Symbol >> asMutator [
	"often known as #asSetter"

	self last = $: ifTrue: [^self].
	^(self, ':') asSymbol
]

{ #category : '*GsBasePharoCompatibility-Core' }
Symbol >> isUnary [

	^self argumentCount = 0
]
