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

{ #category : 'Collection extensions' }
GsBasePharoCompatibilityTest >> test_allButLastDo_ [

	| sum |
	sum := 0.
	(1 to: 5) allButLastDo: [:each | sum := sum + each].
	self
		assert: sum
		equals: 10.
]

{ #category : 'TODO_DataFrame' }
GsBasePharoCompatibilityTest >> test_as_ [
	"Test #as:, #copySameAs:, and #newFrom: for the specific needs of DataFrames.
	 More general/robust implementations left for another day."
]

{ #category : 'Integer extensions' }
GsBasePharoCompatibilityTest >> test_asCharacterDigit [

	self
		assert: 0 asCharacterDigit
		equals: $0.
	self
		assert: 9 asCharacterDigit
		equals: $9.
	self
		assert: 10 asCharacterDigit
		equals: $A.
	self
		assert: 35 asCharacterDigit
		equals: $Z.
]

{ #category : 'Symbol extensions' }
GsBasePharoCompatibilityTest >> test_asMutator [

	self
		assert: #value asMutator
		equals: #value:.
	self
		assert: #value: asMutator
		equals: #value:.

	"It doesn't care about the structure of the symbol."
	self
		assert: #the:quick:brown:fox: asMutator
		equals: #the:quick:brown:fox:.
	self
		assert: #~= asMutator
		equals: #'~=:'.
]

{ #category : 'General extensions' }
GsBasePharoCompatibilityTest >> test_assertEmpty_ [

	self
		shouldnt: [self assertEmpty: #()]
		raise: Exception.
	self
		should: [self assertEmpty: #(a)]
		raise: TestResult failure.
]

{ #category : 'General extensions' }
GsBasePharoCompatibilityTest >> test_assertWithDescription_ [

	self
		shouldnt: [[true] assertWithDescription: 'Block should have evaluated true']
		raise: Exception.
	self
		should: [[false] assertWithDescription: 'Block should have evaluated true']
		raise: TestResult failure.
]

{ #category : 'Collection extensions' }
GsBasePharoCompatibilityTest >> test_associationsDo_ [
]

{ #category : 'General extensions' }
GsBasePharoCompatibilityTest >> test_asUnsignedInteger [

	self
		assert: 'abc' asUnsignedInteger
		equals: nil.
	self
		assert: '' asUnsignedInteger
		equals: nil.
	self
		assert: 'abc123' asUnsignedInteger
		equals: 123.
	self
		assert: '456' asUnsignedInteger
		equals: 456.
	self
		assert: '0' asUnsignedInteger
		equals: 0.
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

{ #category : 'String extensions' }
GsBasePharoCompatibilityTest >> test_capitalized [

	self
		assert: 'abcdef' capitalized
		equals: 'Abcdef'.
	self
		assert: 'ABCDEF' capitalized
		equals: 'ABCDEF'.

	self
		assert: #abcdef capitalized
		equals: #Abcdef.
	self
		assert: #ABCDEF capitalized
		equals: #ABCDEF.
]

{ #category : 'Collection extensions' }
GsBasePharoCompatibilityTest >> test_copyFirst_ [

	self
		assert: ((1 to: 5) copyFirst: 3)
		equals: #(1 2 3).
]

{ #category : 'Collection extensions' }
GsBasePharoCompatibilityTest >> test_count_ [

	self
		assert: ((1 to: 10) count: [:each | each odd])
		equals: 5.
	self
		assert: ((1 to: 10) asSet count: [:each | each odd])
		equals: 5.
]

{ #category : 'Date extensions' }
GsBasePharoCompatibilityTest >> test_ddmmyyyy [

	self
		assert: self createTestDate ddmmyyyy
		equals: '28/09/2018'.
]

{ #category : 'Integer extensions' }
GsBasePharoCompatibilityTest >> test_digitAt_base_ [

	self
		assert: (42 digitAt: 2 base: 10)
		equals: 4.
	self
		assert: (42 digitAt: 1 base: 10)
		equals: 2.
	self
		assert: (16rFF digitAt: 1 base: 16)
		equals: 15.
	self
		assert: (1 digitAt: 2 base: 10)
		equals: 0.
]

{ #category : 'Collection extensions' }
GsBasePharoCompatibilityTest >> test_errorNotFound_ [

	self
		should: [#() errorNotFound: nil]
		raise: LookupError.
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

{ #category : 'Symbol extensions' }
GsBasePharoCompatibilityTest >> test_isUnary [

	self
		assert: #value isUnary
		equals: true.
	self
		assert: #value: isUnary
		equals: false.
	self
		assert: #~= isUnary
		equals: false.

	"It doesn't care about the structure of the symbol."
	self
		assert: #the:quick:brown:fox: isUnary
		equals: false.
	self
		assert: #'~=:' isUnary
		equals: false.
]

{ #category : 'Integer extensions' }
GsBasePharoCompatibilityTest >> test_isZero [

	self
		assert: 0 isZero
		equals: true.
]

{ #category : 'General extensions' }
GsBasePharoCompatibilityTest >> test_key_value_ [

	self
		assert: (Association key: 1 value: 'x')
		equals: (1 -> 'x')
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

{ #category : 'String extensions' }
GsBasePharoCompatibilityTest >> test_lines [

	| sample |
	sample := 'line 1
line 2
line 3'.

	self
		assert: sample lines
		equals: #('line 1' 'line 2' 'line 3').
]

{ #category : 'Integer extensions' }
GsBasePharoCompatibilityTest >> test_log [

	self
		assert: 10 log class
		equals: SmallDouble.
	self
		assert: 10 log asFraction
		equals: 1.
	self
		assert: 100 log asFraction
		equals: 2.
	self
		assert: 1000 log asFraction
		equals: 6755399441055743/2251799813685248.	"Slight precision loss from division."

]

{ #category : 'Date extensions' }
GsBasePharoCompatibilityTest >> test_mmddyyyy [

	self
		assert: self createTestDate mmddyyyy
		equals: '09/28/2018'.
]

{ #category : 'AbstractDictionary extensions' }
GsBasePharoCompatibilityTest >> test_newFromKeys_andValues_ [

	| testDictionary actual |
	testDictionary := self createTestDictionary.
	actual := Dictionary newFromKeys: #('a' 'b' 'c' 'aa' 'bb' 'cc') andValues: #(123 234 345 123123 234234 345345).

	self
		assert: actual
		equals: testDictionary.
]

{ #category : 'AbstractDictionary extensions' }
GsBasePharoCompatibilityTest >> test_newFromPairs_ [

	| testDictionary |
	testDictionary := Dictionary newFromPairs: #('a' 123 'b' 234 'c' 345).
	self
		assert:
			testDictionary keys asSortedCollection asArray
		equals: #('a' 'b' 'c').
	self
		assert:
			(testDictionary at: 'a')
		equals: 123.
	self
		assert:
			(testDictionary at: 'b')
		equals: 234.
	self
		assert:
			(testDictionary at: 'c')
		equals: 345.
]

{ #category : 'Integer extensions' }
GsBasePharoCompatibilityTest >> test_printOn_base_nDigits_ [

	| stream |
	stream := String new writeStream.

	42 printOn: stream base: 10 nDigits: 4.
	self
		assert: stream contents
		equals: '0042'.

	stream reset.
	1234 printOn: stream base: 10 nDigits: 4.
	self
		assert: stream contents
		equals: '1234'.

	stream reset.
	12345 printOn: stream base: 10 nDigits: 4.
	self
		assert: stream contents
		equals: '12345'.

	stream reset.
	16rABCD printOn: stream base: 16 nDigits: 4.
	self
		assert: stream contents
		equals: 'ABCD'.
]

{ #category : 'General extensions' }
GsBasePharoCompatibilityTest >> test_readInto_startingAt_count_ [

	| target |

	target := '123456' copy.
	self
		assert: ('abcdef' readStream readInto: target startingAt: 2 count: 3)
		equals: 3.
	self
		assert: target
		equals: '1abc56'.

	target := (1 to: 6) asArray.
	self
		assert: ('abcdef' readStream readInto: target startingAt: 2 count: 3)
		equals: 3.
	self
		assert: target
		equals: #(1 $a $b $c 5 6).
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

{ #category : 'Collection extensions' }
GsBasePharoCompatibilityTest >> test_select_thenCollect_ [

	| actual |
	actual := (1 to: 5) select: [:each | each even] thenCollect: [:each | each * 2].

	self
		assert: actual
		equals: #(4 8).
]

{ #category : 'Date extensions' }
GsBasePharoCompatibilityTest >> test_String_asDate [

	self
		assert: self createTestDate yyyymmdd asDate
		equals: self createTestDate
]

{ #category : 'Symbol extensions' }
GsBasePharoCompatibilityTest >> test_value_ [

	self
		assert: ((1 to: 10) count: #odd)
		equals: 5.
	self
		assert: ((1 to: 10) asSet count: #odd)
		equals: 5.
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

{ #category : 'Collection extensions' }
GsBasePharoCompatibilityTest >> test_withIndexCollect_ [

	self
		assert: (#(10 20 30) withIndexCollect: [:each :index | each + (index * 2)])
		equals: #(12 24 36)
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

{ #category : 'Float extensions' }
GsBasePharoCompatibilityTest >> testFloatExtensions [

	self
		assert: PlusInfinity isFinite
		equals: false.
	self
		assert: PlusQuietNaN isFinite
		equals: false.
	self
		assert: Float pi isFinite
		equals: true.

	self
		assert: PlusInfinity isNaN
		equals: false.
	self
		assert: PlusQuietNaN isNaN
		equals: true.
	self
		assert: Float pi isNaN
		equals: false.

	self
		assert: PlusInfinity isZero
		equals: false.
	self
		assert: PlusQuietNaN isZero
		equals: false.
	self
		assert: Float pi isZero
		equals: false.
	self
		assert: 0.0d0 isZero
		equals: true.
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
