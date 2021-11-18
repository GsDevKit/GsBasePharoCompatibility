Extension { #name : 'Time' }

{ #category : '*GsBasePharoCompatibility-Core' }
Time class >> hour: hours minute: minutes second: seconds [
	| secondsSinceMidnight |
	secondsSinceMidnight := (hours * 60 + minutes) * 60 + seconds.
	^ self fromMicroseconds: (secondsSinceMidnight * 1000000) roundedNoFpe
]

{ #category : '*GsBasePharoCompatibility-Core' }
Time class >> millisecondsPerDay [

	^86400000
]

{ #category : '*GsBasePharoCompatibility-Core' }
Time class >> secondsPerDay [

	^86400
]

{ #category : '*GsBasePharoCompatibility-Core' }
Time class >> secondsPerHour [

	^3600
]

{ #category : '*GsBasePharoCompatibility-Core' }
Time class >> secondsPerMinute [

	^60
]
