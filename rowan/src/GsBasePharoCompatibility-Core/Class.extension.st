Extension { #name : 'Class' }

{ #category : '*GsBasePharoCompatibility-Core' }
Class >> withAllSubclasses [
	"Answer a Set of the receiver, the receiver's descendent's, and the  
	receiver's descendent's subclasses."

	^ self allSubclasses add: self;
		 yourself
]
