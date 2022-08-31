Class {
	#name : 'CollectionIsEmpty',
	#superclass : 'Error',
	#category : 'GsBasePharoCompatibility-Core'
}

{ #category : 'instance creation' }
CollectionIsEmpty class >> signalWith: aCollection [

	^ self new
		collection: aCollection;
		signal
]

{ #category : 'Instance initialization' }
CollectionIsEmpty >> buildMessageText [

	^ messageText := self standardMessageText
]

{ #category : 'private' }
CollectionIsEmpty >> collection [
	"Return the collection where something is not found in"
	
	^ self signaler
]

{ #category : 'accessing' }
CollectionIsEmpty >> collection: aCollection [
	"Set the collection where something is not found in"
	
	self signaler: aCollection
]

{ #category : 'private' }
CollectionIsEmpty >> standardMessageText [
	"Generate a standard textual description"
	
	^ String streamContents: [ :stream |
		stream print: self collection.
		stream << ' is empty' ]
]
