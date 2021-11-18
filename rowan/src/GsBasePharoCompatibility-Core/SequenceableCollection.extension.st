Extension { #name : 'SequenceableCollection' }

{ #category : '*GsBasePharoCompatibility-Core' }
SequenceableCollection >> writeStream [

"Returns a WriteStream on the receiver."

^ WriteStream on: self
]
