Class {
	#name : 'GsBasePharoCompatibilityTest',
	#superclass : 'TestCase',
	#category : 'GsBasePharoCompatibility-Tests'
}

{ #category : 'support' }
GsBasePharoCompatibilityTest >> createTestDate [

	^Date newDay: 28 monthNumber: 9 year: 2018
]

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

{ #category : 'Date extensions' }
GsBasePharoCompatibilityTest >> test_ddmmyyyy [

	self
		assert: self createTestDate ddmmyyyy
		equals: '28/09/2018'.
]

{ #category : 'Date extensions' }
GsBasePharoCompatibilityTest >> test_fromISOString_ [

	self
		assert: (Date fromISOString: self createTestDate yyyymmdd)
		equals: self createTestDate.
]

{ #category : 'Time extensions' }
GsBasePharoCompatibilityTest >> test_hour_minute_second_ [

	self
		assert: (Time hour: 0 minute: 0 second: 0) printString
		equals: '00:00:00'.
	self
		assert: (Time hour: 11 minute: 59 second: 59) printString
		equals: '11:59:59'.
	self
		assert: (Time hour: 12 minute: 0 second: 0) printString
		equals: '12:00:00'.
	self
		assert: (Time hour: 23 minute: 59 second: 59) printString
		equals: '23:59:59'.
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

{ #category : 'Date extensions' }
GsBasePharoCompatibilityTest >> test_mmddyyyy [

	self
		assert: self createTestDate mmddyyyy
		equals: '09/28/2018'.
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

{ #category : 'SequenceableCollection extensions' }
GsBasePharoCompatibilityTest >> test_writeStream [

	self
		assert: (String new writeStream isKindOf: WriteStream)
		description: 'Expected a kind of WriteStream'.
]

{ #category : 'Date extensions' }
GsBasePharoCompatibilityTest >> test_yyyymmdd [

	self
		assert: self createTestDate yyyymmdd
		equals: '2018-09-28'.
]

{ #category : 'Duration & Number extensions' }
GsBasePharoCompatibilityTest >> testNumberDurationExtensions [
	"Test the Number extensions that create Durations,
	 thereby testing the corresponding Duration extensions."

	"Singular form, for grammar purists"
	self
		assert: 1 day printString
		equals: '1:00:00:00'.
	self
		assert: 1 hour printString
		equals: '0:01:00:00'.
	self
		assert: 1 minute printString
		equals: '0:00:01:00'.
	self
		assert: 1 second printString
		equals: '0:00:00:01'.
	self
		assert: 1 millisecond printString
		equals: '0:00:00:00.001'.

	"Plural form, for grammar purists"
	self
		assert: 2 days printString
		equals: '2:00:00:00'.
	self
		assert: 2 hours printString
		equals: '0:02:00:00'.
	self
		assert: 2 minutes printString
		equals: '0:00:02:00'.
	self
		assert: 2 seconds printString
		equals: '0:00:00:02'.
	self
		assert: 2 milliseconds printString
		equals: '0:00:00:00.002'.
	self
		assert: 2 milliSeconds printString
		equals: '0:00:00:00.002'.

	"Miniscule durations that truncate during printing"
	self
		assert: 1 microsecond asSeconds
		equals: 0.000001s6.
	self
		assert: 2 microseconds asSeconds
		equals: 0.000002s6.
	self
		assert: 1 nanosecond asSeconds
		equals: 0.000000001s9.
	self
		assert: 2 nanoseconds asSeconds
		equals: 0.000000002s9.
	self
		assert: 1 nanoSecond asSeconds
		equals: 0.000000001s9.
	self
		assert: 2 nanoSeconds asSeconds
		equals: 0.000000002s9.

	"Make sure the grammatically incorrect forms give the right results."
	self
		assert: (Duration milliseconds: 123)
		equals: (Duration milliSeconds: 123).
	self
		assert: (Duration nanoseconds: 123)
		equals: (Duration nanoSeconds: 123).
]
