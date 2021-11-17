Class {
	#name : 'GsBasePharoCompatibilityTest',
	#superclass : 'TestCase',
	#category : 'GsBasePharoCompatibility-Tests'
}

{ #category : 'support' }
GsBasePharoCompatibilityTest >> createTestDictionary [

	^Dictionary new
		at: 'a' put: 123;
		at: 'b' put: 234;
		at: 'c' put: 345;
		at: 'aa' put: 123123;
		at: 'bb' put: 234234;
		at: 'cc' put: 345345;
		yourself.
]

{ #category : 'support' }
GsBasePharoCompatibilityTest >> setUp [

	super setUp.
	self createTestDictionary.
]

{ #category : 'Collection extensions' }
GsBasePharoCompatibilityTest >> test_associationsDo_ [
]

{ #category : 'AbstractDictionary extensions' }
GsBasePharoCompatibilityTest >> test_at_ifPresent_ifAbsent_ [

	| testDictionary |
	testDictionary := self createTestDictionary.
	self
		assert:
			(testDictionary at: 'a' ifPresent: [ #'present' ] ifAbsent: [ #'absent' ])
		equals: #'present'.
	self
		assert:
			(testDictionary at: 'x' ifPresent: [ #'present' ] ifAbsent: [ #'absent' ])
		equals: #'absent'.
]

{ #category : 'AbstractDictionary extensions' }
GsBasePharoCompatibilityTest >> test_keysSortedSafely [

	| testDictionary |
	testDictionary := self createTestDictionary.
	self
		assert: testDictionary keysSortedSafely
		equals: #('a' 'aa' 'b' 'bb' 'c' 'cc').
	self
		assert: Dictionary new keysSortedSafely
		equals: #().
]

{ #category : 'Collection extensions' }
GsBasePharoCompatibilityTest >> test_removeAll [

	self
		assert: #(1 2 3) asOrderedCollection removeAll
		equals: OrderedCollection new.
	self
		assert: #(1 2 3) asSet removeAll
		equals: Set new.
]

{ #category : 'AbstractDictionary extensions' }
GsBasePharoCompatibilityTest >> test_removeAll_Dictionary [

	| testDictionary |
	testDictionary := self createTestDictionary.
	self
		assert: testDictionary removeAll
		equals: Dictionary new.
]

{ #category : 'Class extensions' }
GsBasePharoCompatibilityTest >> test_withAllSubclasses [

	| classes |
	classes := (Integer withAllSubclasses
		asSortedCollection: [ :a :b | a name < b name ]) asArray.
	self
		assert: classes
		equals:
			{Integer.
			LargeInteger.
			SmallInteger}.
]
